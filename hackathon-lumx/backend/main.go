package main

import (
	"fanify/db"
	"fanify/middleware"
)

// @title           Fidz
// @version         1.0
// @description     This is a server for app.

// @host      localhost:8080

// @securityDefinitions.basic  BasicAuth

// @externalDocs.description  OpenAPI
// @externalDocs.url          https://swagger.io/resources/open-api/
func main() {
	r := middleware.SetupRouter()
	db.ConnectDatabase()
	r.Run(":8080")
}
