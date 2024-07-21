# Shopptex API

![Ruby](https://img.shields.io/badge/-Ruby-white?style=for-the-badge&logo=ruby&color=CC342D&logoColor=white)

Esta API fornece informações sobre produtos e sobre a loja. É implementada utilizando apenas módulos padrão do Ruby e lê os dados a partir de arquivos `CSV`. Este projeto é um desafio proposto no curso de desenvolvimento backend Ruby da FAP/Softex.

## Rotas

### `GET /products`

Retorna uma lista de produtos. Cada produto é representado por um objeto com as seguintes propriedades:

- **photo**: `string`  
  URL da imagem do produto (proporção 1:1 recomendada).

- **name**: `string`  
  Nome do produto.

- **price**: `number`  
  Preço do produto.

- **is_promotion**: `boolean`  
  Se verdadeiro, aplica um desconto de 20% no valor do preço.

**Exemplo de Resposta:**

```json
[
  {
    "photo": "https://example.com/images/laptop.png",
    "name": "Laptop Gamer",
    "price": 2500.00,
    "is_promotion": true
  },
  {
    "photo": "https://example.com/images/mouse.png",
    "name": "Mouse Wireless",
    "price": 150.00,
    "is_promotion": false
  }
]
```

### `GET /info`

Retorna informações sobre a loja. As propriedades da loja são:

- **name**: `string`  
  Nome da loja.

- **color**: `string`  
  Cor da loja no formato hexadecimal.

- **owner**: `string`  
  Nome completo do proprietário da loja.

- **department**: `string`  
  Departamento da loja.

**Exemplo de Resposta:**

```json
{
  "name": "Loja Tech",
  "color": "#FF5733",
  "owner": "João da Silva",
  "department": "Informática"
}
```

## Dados

Os dados para a rota `/products` são armazenados no arquivo csv database.csv

## Dependências

A API é implementada utilizando apenas módulos padrão do Ruby, com a exceção da gem artii para a geração de arte em texto, incluindo:

- `csv` para escrita de arquivos CSV.
- `json` para manipulação de dados JSON.
- `artii` utilizada para gerar arte em texto.

## Configuração e Execução

1. **Certifique-se de que Ruby está instalado.**
2. **Clone o repositório:**

   ```bash
   git clone <URL_DO_REPOSITORIO>
   ```

3. **Navegue até o diretório do projeto:**

   ```bash
   cd <DIRETORIO_DO_PROJETO>
   ```

4. **Execute o servidor:**

   ```bash
   ruby server.rb
   ```

   O servidor estará rodando em `http://localhost:8080`.

5. **Acesse as rotas:**

   - **Produtos:** `http://localhost:8080/products`
   - **Informações da Loja:** `http://localhost:8080/info`

## Exemplo de Uso

Utilize ferramentas como `curl` ou clientes HTTP para acessar as rotas e visualizar as respostas:

```bash
curl http://localhost:8080/products
curl http://localhost:8080/info
```

## Licença

Distribuído sob a licença MIT. Veja [LICENSE](LICENSE) para mais detalhes.
