# Arquitetura do Projeto (MVC)

Para a criação do Contrata Fácil foi ultilizado a arquitetura 
MVC:

**Model**: Pasta na qual fica os arquivos de armazenamento de 
dados do (Usuário, Prestadores e tabela de avaliações).

**View**: Pasta na qual fica a interface da aplicação. Telas 
de cadastro de usuário, tela de login, tela de cadastro de 
prestador, tela de serviços, tela de perfil, tela Home.

**Control**: Pasta responsável por realizar o processo de
intermediação entre **Model** e **View**, sendo responsável 
pelo gerenciamento dos dados entre telas e banco de dados. 

# Fluxo de dados 
 * O usuário interage com as telas **(View)** , como por exemplo 
 'clicar em um botão de salvar cadastro'.

* Durante a interação  classe UserController **(control)** é 
    acionada, e inicia o processo do usuário dentro das variáveis 
    do user **(model)**   ela envia e recebe os dados do banco de dados
    SQLite.

* O userController **(Controller)** retorna os dados para a tela **(view)**.

<!-- Código para por imagens dentro da documentação  -->
![Diagrama Caso de Uso](docs/SERVIÇO.png)
![Diagrama Conceitual](docs/Conceitual.png)

# Banco de dados

   ' Tabela Usuário '
   - **idUser** : identificador único para o usuário
   - **nome** : nome do usuário 
   - **email** : email do usuário
   - **senha** : senha do usuário

   ' Tabela Prestador '
   - **idprestador** : identificador único para o Prestador
   - **nome** : nome do Prestador
   - **telefone**:  telefone do prestador
   - **especialidade** : especialidade do prestador de serviço
   
   ' Tabela Avaliacao ' 
   - **idAvaliacao** : indentificador único de Avaliacao
   - **texto** : variavel que recebe a parte escrita da avialiação
   - **rating** : variavel que recebe o número de avalição
   - **idUser** : identificador único de usuario referenciado
   - **idPrestador** : indentificador único de prestador referenciado 