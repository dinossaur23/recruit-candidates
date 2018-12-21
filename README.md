# Recruit Candidates

To helps the recruiter analyze incoming applications for job vacancy, this RESTful API in Rails was created using versioning and patterns and good pratices like services, Rspec to unit tests and factories. Also it uses the Postgresql to database and Json serialization in the responses. One of the functionalities is to receive the candidates registered in a vacancy ordered by the score, which is calculated using the levels of candidates and vacancies and also using a resulting relative to a calculation of the distance of the two. This result is a shorter paths calculation based on the [Dijkstra algorithm](https://medium.com/basecs/finding-the-shortest-path-with-a-little-help-from-dijkstra-613149fbdc8e), using the candidates and the vacancy as nodes in a graph.

## Instalation

Clone the repo:

```
$ git clone https://github.com/dinossaur23/recruit-candidates.git
$ cd recruit-candidates
```

Download the dependencies:

```
$ bundle install
```

Run pending migrations:

```
$ rails db:migrate
```

Start the API:

```
$ rails server
```

## Ruby version
2.3.3

## API Documentation
[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.getpostman.com/collections/8637fea9add90554f613)

For a better experience, the collection with the examples of requests was exported to Postman in the button above.

### Candidates
#### POST pessoas
Create candidates. Returns the candidate when successful with status HTTP 201. Returns a json describing the failure condition when unsuccessful with status HTTP 422. The response format is JSON.

##### Resource URL
`http://localhost:3000/api/v1/pessoas`

##### Parameters
| Parameter     | Description                      | Required  |
| ------------- | -------------------------------- | --------- |
| nome          | The name of the candidate        | true      |
| profissao     | The profession of the candidate  | true      |
| localizacao   | The location of the candidate    | true      |
| nivel         | The level of the candidate       | true      |

##### Example request
```json
{
	"nome": "Maria",
	"profissao": "Engenheira de Software",
	"localizacao": "A",
	"nivel": 3
}
```

##### Example response
```json
{
    "id": 12,
    "nome": "Maria",
    "profissao": "Engenheira de Software",
    "localizacao": "A",
    "nivel": 3
}
```

### Vacancies
#### POST vagas
Create vacancy. Returns the vacancy when successful with status HTTP 201. Returns a json describing the failure condition when unsuccessful with status HTTP 422. The response format is JSON.

##### Resource URL
`http://localhost:3000/api/v1/vagas`

##### Parameters
| Parameter     | Description                      | Required  |
| ------------- | -------------------------------- | --------- |
| empresa       | The company of the vacancy       | true      |
| titulo        | The title of the vacancy         | true      |
| descricao     | The description of the vacancy   | true      |
| localizacao   | The location of the vacancy      | true      |
| nivel         | The level of the vacancy         | true      |

##### Example request
```json
{
	"empresa": "Top",
	"titulo": "Vaga teste",
	"descricao": "Criar os mais diferentes tipos de teste",
	"localizacao": "C",
	"nivel": 4
}
```

##### Example response
```json
{
    "id": 4,
    "empresa": "Top",
    "titulo": "Vaga teste",
    "descricao": "Criar os mais diferentes tipos de teste",
    "localizacao": "C",
    "nivel": 4
}
```

### Candidatures
#### POST candidaturas
Create candidacies. Returns when successful with status HTTP 201. Returns a json describing the failure condition when unsuccessful with status HTTP 422. The response format is JSON.

##### Resource URL
`http://localhost:3000/api/v1/candidaturas`

##### Parameters
| Parameter     | Description                      | Required  |
| ------------- | -------------------------------- | --------- |
| id_pessoa     | The id of the candidate          | true      |
| id_vaga       | The id of the vacancy            | true      |

##### Example request
```json
{
	"id_pessoa": 1,
	"id_vaga": 1
}
```

### Ranking
#### GET ranking
Return all the candidates of a vacancy with status HTTP 200. Returns a json describing the failure condition when unsuccessful with status HTTP 422. When the id is invalid retuns status HTTP 400. The response format is JSON.

##### Resource URL
`http://localhost:3000/api/v1/vagas/:id/candidaturas/ranking`

##### Parameters
| Parameter     | Description                      | Required  |
| ------------- | -------------------------------- | --------- |
| id            | The name of the vacancy          | true      |

##### Example response
```json
[
    {
        "nome": "Maria",
        "profissao": "Engenheiro de Software",
        "localizacao": "A",
        "nivel": 3,
        "score": 100
    },
    {
        "nome": "John Doe",
        "profissao": "Engenheiro de Software",
        "localizacao": "C",
        "nivel": 2,
        "score": 62
    }
]
```

## Tests
To run the tests:

```
$ rspec
```
