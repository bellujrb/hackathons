package storage

import (
	inter "synhelper/internal/field/interface"
	repo "synhelper/repository"

	"gorm.io/gorm"
)

func CreateField(q *gorm.DB, data inter.Field) (*repo.Field, error) {
	field := &repo.Field{
		Name:  data.Name,
		Loc:   data.Loc,
		Rank:  data.Rank,
		Price: data.Price,
		Area:  data.Area,
	}
	if err := q.Create(field).Error; err != nil {
		return nil, err
	}
	return field, nil
}

func SearchField(q *gorm.DB, data inter.SearchField) (*repo.Field, error) {
	var field repo.Field
	if err := q.First(&field, data.ID).Error; err != nil {
		return nil, err
	}
	return &field, nil
}

func UpdateField(q *gorm.DB, data inter.Field) error {
	field := &repo.Field{
		Name:  data.Name,
		Loc:   data.Loc,
		Rank:  data.Rank,
		Price: data.Price,
		Area:  data.Area,
	}
	if err := q.Save(field).Error; err != nil {
		return err
	}
	return nil
}

func DeleteField(q *gorm.DB, data inter.SearchField) error {
	var field repo.Field
	if err := q.First(&field, data.ID).Error; err != nil {
		return err
	}
	if err := q.Delete(&field).Error; err != nil {
		return err
	}
	return nil
}

func SearchAllField(q *gorm.DB) (*[]repo.Field, error) {
	var fields []repo.Field
	if err := q.Find(&fields).Error; err != nil {
		return nil, err
	}
	return &fields, nil
}
