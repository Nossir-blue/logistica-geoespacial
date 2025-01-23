# Sistema de Gestão Logística com Leaflet e MySQL

Este projeto é um sistema simples de gestão de localizações geográficas para empresas de logística, utilizando MySQL para armazenamento de dados e Leaflet para visualização em mapas.

## Funcionalidades
- Inserção de localizações de armazéns e rotas.
- Cálculo da distância entre dois pontos.
- Consulta de armazéns próximos de um ponto.
- Visualização interativa dos dados em um mapa.

## Estrutura do Projeto
- **`index.html`**: Página principal contendo o mapa e a estrutura HTML.
- **`style.css`**: Estilos da aplicação para personalizar a aparência do mapa e outros elementos.
- **`script.js`**: Lógica de visualização no Leaflet, incluindo a interação com a API PHP.
- **`dados.php`**: Script PHP que consulta a base de dados MySQL e retorna os dados no formato JSON para a aplicação.
- **`database.sql`**: Script para recriar a base de dados e tabelas no MySQL.
- **`README.md`**: Este arquivo de documentação.

## Tecnologias Utilizadas
- **MySQL/MariaDB** para armazenamento e consulta de dados geográficos.
- **PHP** para interação entre o front-end e o banco de dados.
- **Leaflet.js** para visualização dos dados geográficos em mapas.
- **XAMPP** (ou Apache) para servir os arquivos da aplicação localmente.

## Pré-requisitos
Antes de rodar a aplicação, certifique-se de ter os seguintes pré-requisitos instalados:
1. **XAMPP** (ou outro servidor Apache com PHP) para rodar o servidor e o MySQL.
2. **MySQL/MariaDB** para o banco de dados.
3. **Git** para clonar o repositório (opcional, caso queira contribuir ou versionar o projeto).

## Como Configurar

### 1. Configuração do Banco de Dados
1. Abra o **XAMPP** e inicie os serviços **Apache** e **MySQL**.
2. Acesse o **phpMyAdmin** (geralmente em `http://localhost/phpmyadmin`).
3. Importe o arquivo `database.sql`:
   - Selecione o banco de dados onde deseja importar os dados (ou crie um novo).
   - Vá até a aba **Importar**, escolha o arquivo `database.sql` e clique em **Executar**.
   - Isso criará as tabelas e dados necessários para o sistema.

### 2. Configuração do Servidor Local
1. Coloque todos os arquivos do projeto na pasta `htdocs` do XAMPP (geralmente em `C:\xampp\htdocs`).
   - Crie uma pasta dentro de `htdocs` (ex: `logistica`).
   - Coloque os arquivos `index.html`, `style.css`, `script.js`, `dados.php` e `database.sql` dentro dessa pasta.
2. Acesse o arquivo `index.html` através de seu navegador em `http://localhost/logistica/index.html`.

### 3. Configuração de Conexão no PHP
Se necessário, edite o arquivo `dados.php` para configurar a conexão com o banco de dados. No script, verifique se os detalhes de conexão (host, usuário, senha e banco de dados) estão corretos:
```php
$host = '127.0.0.1';
$port = 3307; // Porta padrão do MySQL no XAMPP
$db = 'logistica'; // Nome do banco de dados
$user = 'root'; // Usuário do MySQL
$pass = ''; // Senha do MySQL (em XAMPP geralmente é vazio)

---

### **Explicação do conteúdo:**

- **Como Configurar**: Instruções detalhadas sobre como configurar o ambiente de desenvolvimento.
- **Pré-requisitos**: Lista de dependências necessárias (XAMPP, MySQL, Git).
- **Passo a Passo**: Instruções claras para instalar e testar o sistema.
- **Contribuição**: Instruções básicas para contribuir com o código, caso outras pessoas queiram melhorar o projeto.
- **Licença**: Inclui uma seção de licença (se necessário). Você pode optar por licenciar o código sob a [MIT License](https://opensource.org/licenses/MIT).

---

