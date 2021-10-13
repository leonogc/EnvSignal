require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'Inválido sem nome' do
    user = User.new
    user.birth_date = Date.parse("17/10/1990")
    user.username = "rogerio_satrah"
    user.email = "rogerio_satrah@gmail.com"
    user.password = "senhasecretaK"
    expect(user).not_to be_valid
  end
  it 'Inválido sem data de nascimento' do
    user = User.new
    user.name = "Rogerio Satrah Ka"
    user.username = "rogerio_satrah"
    user.email = "rogerio_satrah@gmail.com"
    user.password = "senhasecretaK"
    expect(user).not_to be_valid
  end
  it 'Inválido menor de idade' do
    user = User.new
    user.name = "Rogerio Satrah Ka"
    user.birth_date = Date.today
    user.username = "rogerio_satrah"
    user.email = "rogerio_satrah@gmail.com"
    user.password = "senhasecretaK"
    expect(user).not_to be_valid
  end
  it 'Inválido sem nome de usuário' do
    user = User.new
    user.name = "Rogerio Satrah Ka"
    user.email = "rogerio_satrah@gmail.com"
    user.birth_date = Date.parse("17/10/1990")
    user.password = "senhasecretaK"
    expect(user).not_to be_valid
  end
  it 'Inválido nome de usuário indisponível' do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    user2 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah2@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save

    expect(user1).to eq(true)
    expect(user2).to eq(false)
  end
  it 'Inválido sem email' do
    user = User.new
    user.name = "Rogerio Satrah Ka"
    user.birth_date = Date.parse("17/10/1990")
    user.username = "rogerio_satrah"
    user.password = "senhasecretaK"
    expect(user).not_to be_valid
  end
  it 'Inválido com email com formato não suportado' do
    user = User.new
    user.name = "Rogerio Satrah Ka"
    user.birth_date = Date.parse("17/10/1990")
    user.username = "rogerio_satrah"
    user.email = "rogerio_satrah!#%SAzxc@Aaczxcb......xzcb"
    user.password = "senhasecretaK"
    expect(user).not_to be_valid
  end
  it 'Inválido sem senha' do
    user = User.new
    user.name = "Rogerio Satrah Ka"
    user.birth_date = Date.parse("17/10/1990")
    user.username = "rogerio_satrah"
    user.email = "rogerio_satrah@gmail.com"
    expect(user).not_to be_valid
  end
end
