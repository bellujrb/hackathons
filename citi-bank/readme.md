# Aplicação para Conversão de Dados CSV para Formato CNAB 750

Esta aplicação é responsável por converter dados fornecidos em formato CSV para o formato CNAB 750. O formato CNAB 750 é amplamente utilizado em transações financeiras no Brasil e segue um layout padronizado para facilitar a integração com sistemas bancários.

### Como utilizar a aplicação na parte de Front-End

Certifique-se de ter instalado o Dart e Flutter em sua máquina.

Clone este repositório em seu ambiente local.

```
git clone https://github.com/bellujrb/pix-hackathon-citi
```

Navegue até o diretório do projeto.

```
cd app
```

Instale as dependências do projeto.

```
flutter pub add
```

Execute a aplicação fornecendo com o seguinte comando.

```
flutter run
```

### Como utilizar a aplicação na parte de back-end

Certifique-se de ter instalado o Node.js em sua máquina.

Clone este repositório em seu ambiente local.

```
git clone https://github.com/bellujrb/pix-hackathon-citi
```

Navegue até o diretório do projeto.

```
cd nome-do-repositorio
```

Instale as dependências do projeto.

```
npm install
```

Prepare o arquivo CSV contendo os dados a serem convertidos. Certifique-se de que o arquivo siga o formato adequado, com as colunas correspondentes aos campos do CNAB 750.

Execute a aplicação fornecendo o caminho para o arquivo CSV.

```
npm run build
npm run start:prod
localhost:3000/api
```

O processo de conversão será iniciado e o resultado será salvo em um novo arquivo com o formato CNAB 750.

Exemplo de Arquivo CSV

```
cpf,nome,tiporegistro,tipopessoa,chave,cobranca,ocorrencia,sequencial,nomedestinado,valor
12345,Empresa,cpf,mei,Chave,1231,12,6543,John,100
```

Certifique-se de que o arquivo CSV esteja estruturado corretamente, com os campos e valores nas posições corretas.

## Resultado da Conversão

O resultado da conversão será salvo em um novo arquivo no formato CNAB 750. O arquivo sera enviado por email para o usuario, ou podera ser requisitado no app, mas com a extensão correspondente ao formato CNAB 750.

# Casos de Uso

Temos casos de uso em nossa aplicação que verificam a validade e autenticidade de CPFs. Caso ocorra algum erro durante o processo, nossa aplicação continua em execução, oferecendo opções de retirada do arquivo resultante. Essas opções incluem o download direto do arquivo, envio por e-mail ou a possibilidade de validação dentro da própria aplicação. Além disso, disponibilizamos uma funcionalidade que codifica os dados em um QR code e os armazena em nossa base de dados, garantindo a segurança e integridade das informações.

É importante ressaltar que, em caso de duplicidades nas requisições, enviamos apenas uma delas, evitando a geração de arquivos redundantes. Estamos empenhados em oferecer uma experiência completa e confiável, permitindo que você escolha a opção mais conveniente para acessar e utilizar seus arquivos, garantindo a eficiência e a integridade dos dados.

# Design Patterns (App)

- Singlethon

# Package externos (App)

- HTTP
- Logger
- Modular
- Google Fonts
- File Picker

# Design Patterns (Backend)

- Decorators
- Singleton
- Factory

# Package externos (Backend)

- NestJs
- Nodemailer
- PapaParser
- Prisma

# Arquitetura usada (Backend)

- Arquitetura Hexagonal
- Modular
