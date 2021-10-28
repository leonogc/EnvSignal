require 'rails_helper'

RSpec.describe Authority, type: :model do
  it 'Invalido sem identificador' do
    authority = Authority.new(
      name: "Corpo de Bombeiros",
      password: "SenhaDosBombeirosTeste"
    )
    expect(authority).not_to be_valid
  end
  it 'Invalido sem nome' do
    authority = Authority.new(
      identifier: 193,
      password: "SenhaDosBombeirosTeste"
    )
    expect(authority).not_to be_valid
  end
  it 'Invalido sem senha' do
    authority = Authority.new(
      identifier: 193,
      name: "Corpo de Bombeiros",
    )
    expect(authority).not_to be_valid
  end
  it 'Invalido identificador indisponível' do
    authority1 = Authority.new(
      identifier: 193,
      name: "Corpo de Bombeiros",
      password: "SenhaDosBombeirosTeste"
    ).save
    authority2 = Authority.new(
      identifier: 193,
      name: "Corpo de Bombeiros",
      password: "SenhaDosBombeirosTeste"
    ).save
    expect(authority1).to eq(true)
    expect(authority2).to eq(false)
  end
end
