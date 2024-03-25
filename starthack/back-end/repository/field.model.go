package repo

type Field struct {
	ID    uint64 `gorm:"column:idPDF;primaryKey;autoIncrement" json:"id"`
	Name  string `gorm:"column:name" json:"name"`
	Loc   string `gorm:"column:loc" json:"loc"`
	Rank  string `gorm:"column:rank" json:"rank"`
	Price string `gorm:"column:price" json:"price"`
	Area  uint64 `gorm:"column:area" json:"area"`
}
