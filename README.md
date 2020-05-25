# README

Requisitos:<br>
 - Ruby On Rails instalado na versão => 5^
 - Postgress instalado na versão => 4^
 <br><br>

Para Rodar a aplicação primeiramente é necessario executar o comando<br>
bundle install<br><br>
Para que todas as dependencias sejam baixadas e instaladas. <br>
Após finalizar o procedimento acima configurar o arquivo database.yml com o postegress instalado, o arquivo se encontra em config/database.yml<br><br>

Concluido a configuração do banco de dados acesse seu gerenciador do banco de dados Postgress e crie um banco de dados para cada ambiente Animalfinder_Development, Animalfinder_Test e Animalfinder_Production, após isso execute o comando rake db:migrate para criar as tabelas.<br><br>

Finalizado toda a configuração execute o comando: rails s e a aplicação irá rodar.