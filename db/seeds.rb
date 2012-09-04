# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# BookName.create([{ name: "托福真题" }, { name: "托福基础" }, { name: "托福预测" }])
ExamType.create([{ name: "TOEFL" }, { name: "SAT" }, { name: "SSAT" }])
WordProperty.create([{ name: "n" }, { name: "v"}, { name: "vi"}, { name: "vt"}, { name: "adj" }, { name: "adv" }, { name: "pron" }, { name: "prep"}])