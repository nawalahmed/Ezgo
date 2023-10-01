//
//  adminPanelHandler.swift
//  ezgo
//
//  Created by Nawal Ahmed on 31/07/2023.
//

import Foundation
import PerfectHTTP
import PerfectMustache
import PerfectSQLite

class MustacheHelper: MustachePageHandler {
    
    var contentDict = [[String: Any]] ()
    
    var values: MustacheEvaluationContext.MapType

    init(values: MustacheEvaluationContext.MapType) {
        self.values = values
    }
    func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
        contxt.extendValues(with: values)
        do {
            try contxt.requestCompleted(withCollector: collector)
        } catch {
            let response = contxt.webResponse
            response.appendBody(string: "\(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func renderAdminPanel(request: HTTPRequest, response: HTTPResponse) {
     
        let dbPath = "./myDatabase.sqlite"
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close() // Make sure to close the database when done
            }

            try retreiveFromDB(sqlite)
            

            let context: [String: Any] = ["pageTitle": "Admin Panel", "orders": contentDict]
            values = context
            mustacheRequest(request: request, response: response, handler: MustacheHelper(values: context), templatePath:  "/Users/nawalahmed/Documents/Developer/ezgo/word.mustache")
            
            
            
        } catch {
            //Handle Errors
        }
    }

    fileprivate func retreiveFromDB(_ sqlite: SQLite) throws {
        //retreive

        let demoStatement = "SELECT id, packageName, description FROM orders ORDER BY id DESC LIMIT :1"
        
        try sqlite.forEachRow(statement: demoStatement, doBindings: {
            
            (statement: SQLiteStmt) -> () in
            
            let bindValue = 1
            try statement.bind(position: 1, bindValue)
            
        }) {(statement: SQLiteStmt, i:Int) -> () in
            
                        contentDict.append([
                            "id": statement.columnText(position: 0),
                            "packageName": statement.columnText(position: 1),
                            "description": statement.columnText(position: 2)
                        ])
            
            print("COtent DICT: \(contentDict)")

            
        }
    }

}

