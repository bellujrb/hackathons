package field

import (
	"net/http"
	"strconv"
	inter "synhelper/internal/field/interface"
	field "synhelper/internal/field/service"

	"github.com/gin-gonic/gin"
)

// @Summary Cria um novo campo
// @Description Cria um novo campo no banco de dados
// @Tags Fields
// @Accept json
// @Produce json
// @Param request body inter.FieldInput true "Dados do campo a ser criado"
// @Success 200 {object} inter.FieldInput "Campo criado com sucesso"
// @Router /fields [post]
func CreateField(c *gin.Context) {
	var fields inter.FieldInput
	if err := c.BindJSON(&fields); err != nil {
		return
	}
	field.CreateField(c, fields)
}

// @Summary Busca um campo pelo ID
// @Description Busca um campo no banco de dados pelo ID
// @Tags Fields
// @Accept json
// @Produce json
// @Param id header uint64 true "ID do campo a ser buscado"
// @Success 200 {object} inter.FieldInput "Campo encontrado com sucesso"
// @Router /fields [get]
func SearchField(c *gin.Context) {
	fields := c.GetHeader("id")
	num, err := strconv.ParseUint(fields, 10, 64)
	if err != nil {
		return
	}
	searchField := inter.SearchField{ID: num}
	field.SearchField(c, searchField)
}

// @Summary Edita um campo existente
// @Description Edita um campo existente no banco de dados
// @Tags Fields
// @Accept json
// @Produce json
// @Param id header uint64 true "ID do campo a ser editado"
// @Param request body inter.FieldInput true "Novos dados do campo"
// @Success 200 {object} inter.FieldInput "Campo editado com sucesso"
// @Router /fields [put]

func EditField(c *gin.Context) {
	id := c.GetHeader("id")
	num, err := strconv.ParseUint(id, 10, 64)
	if err != nil {
		return
	}
	var fields inter.Field
	if err := c.BindJSON(&fields); err != nil {
		return
	}
	fields.ID = num
	field.EditField(c, fields)
}

// @Summary Deleta um campo pelo ID
// @Description Deleta um campo do banco de dados pelo ID
// @Tags Fields
// @Accept json
// @Produce json
// @Param id header uint64 true "ID do campo a ser editado"
// @Success 204 "Campo deletado com sucesso"
// @Router /fields [delete]
func DeleteField(c *gin.Context) {
	fields := c.GetHeader("id")
	num, err := strconv.ParseUint(fields, 10, 64)
	if err != nil {
		return
	}
	searchField := inter.SearchField{ID: num}
	field.DeleteField(c, searchField)
}

// @Summary Busca todos os campos
// @Description Busca todos os campos do banco de dados
// @Tags Fields
// @Accept json
// @Produce json
// @Success 200 {array} inter.FieldInput "Campos encontrados com sucesso"
// @Router /all-fields [get]
func SearchAllField(c *gin.Context) {
	field.SearchAllField(c)
}

// @Summary Classifica um campo com base na área
// @Description Classifica um campo com base na área fornecida
// @Tags Fields
// @Accept json
// @Produce json
// @Param request body inter.ClassifyField true "Área a ser classificada"
// @Success 200 {string} string "Classificação do campo"
// @Router /classify [post]
func ClassifyField(c *gin.Context) {
	var fields inter.ClassifyField
	if err := c.BindJSON(&fields); err != nil {
		return
	}
	res := field.ClassifyField(fields.Area)
	c.JSON(http.StatusOK, gin.H{"data": res})
}
