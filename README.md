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

<br><br>
Rotas:<br>
    post 'URL_BASE/api/v1/login' => 'Realiza o login na aplicação'<br>
    post 'URL_BASE/api/v1/signup' => 'Realiza o cadastro do usuário na aplicação'<br>
    get 'URL_BASE/api/v1/animals' => 'Não necessita de autenticação e exibe todos os animais independente do status'<br>
    get 'URL_BASE/api/v1/lost-animals' => 'Não necessita de autenticação e exibe todos os animais perdidos'<br>
    post 'URL_BASE/api/v1/found' => 'Não necessita de autenticação e comunica um animal desaparecido, informando os campos na request name e phone'<br>
    get 'URL_BASE/api/v1/owner/show' => 'Exibe as informações do proprietario logado na aplicação, não precisa de parametros, pois a aplicação pega os dados pelo token enviado no header'<br>
    put 'URL_BASE/api/v1/owner/edit' => 'Edita as informações do proprietario,  não precisa de parametros, pois a aplicação pega os dados pelo token enviado no header'<br>
    get 'URL_BASE/api/v1/animal/list' => 'Lista todos os animais do proprietario logado na aplicação'<br>
    get 'URL_BASE/api/v1/animal/comunicated/:id' => 'Lista todos os comunicados que foram informados do animal selecionado no :id do proprietario'<br>
    get 'URL_BASE/api/v1/animal/show/:id' => 'Exibe as informações do animal do proprietario logado'<br>
    post 'URL_BASE/api/v1/animal/insert' => 'Insere um novo animal para o proprietario logado'<br>
    put 'URL_BASE/api/v1/animal/edit' => 'Atualiza os dados do animal para o proprietario logado'<br>
    delete 'URL_BASE/api/v1/animal/delete/:id' => 'Deleta um animal para o proprietario logado'<br>