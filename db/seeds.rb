# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

KindTransaction.create([
  {
    kind: 1,
    description: 'Débito',
    nature: :input,
    signal: :plus
  },{
    kind: 2,
    description: 'Boleto',
    nature: :output,
    signal: :minus
  },{
    kind: 3,
    description: 'Financiamento',
    nature: :output,
    signal: :minus
  },{
    kind: 4,
    description: 'Crédito',
    nature: :input,
    signal: :plus
  },{
    kind: 5,
    description: 'Recebimento Empréstimo',
    nature: :input,
    signal: :plus
  },{
    kind: 6,
    description: 'Vendas',
    nature: :input,
    signal: :plus
  },{
    kind: 7,
    description: 'Recebimento TED',
    nature: :input,
    signal: :plus
  },{
    kind: 8,
    description: 'Recebimento DOC',
    nature: :input,
    signal: :plus
  },{
    kind: 9,
    description: 'Aluguel',
    nature: :output,
    signal: :minus
  },
])
