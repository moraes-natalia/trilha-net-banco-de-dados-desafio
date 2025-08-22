# Documentação: Exercício DIO SQL Server no macOS com Docker + VS Code

## Contexto do Projeto

Este projeto faz parte dos desafios práticos do Bootcamp WEX – End to End Engineering, uma iniciativa conjunta entre a WEX, empresa global de tecnologia financeira, e a plataforma de ensino DIO (Digital Innovation One). Apresenta a solução desenvolvida para executar o desafio de banco de dados da trilha .NET da DIO em um ambiente macOS, superando a limitação de não disponibilidade do SQL Server Management Studio (SSMS) para este sistema operacional.

🔗 **Exercício Original: https://github.com/digitalinnovationone/trilha-net-banco-de-dados-desafio**

### Proposta do Desafio

O exercício consiste em realizar 12 consultas SQL em um banco de dados de filmes, abrangendo operações básicas como SELECT, JOIN, filtros, ordenação e agrupamentos. O banco contém 5 tabelas principais (Filmes, Atores, Generos, ElencoFilme, FilmesGenero) com relacionamentos muitos-para-muitos, simulando um sistema real de catalogação cinematográfica.

## Problema e Solução

### Desafio Enfrentado
- Exercício DIO requer SQL Server e SSMS
- SSMS não está disponível para macOS
- Necessidade de ambiente compatível para desenvolvimento SQL

### Solução Implementada
Utilização de **Docker + SQL Server Linux + VS Code** como stack alternativa, proporcionando funcionalidade equivalente ao SSMS através de duas abordagens complementares:

1. **Interface Gráfica**: VS Code com extensão SQL Server
2. **Linha de Comando**: Terminal com sqlcmd via Docker

## Arquitetura da Solução

```
┌─────────────────┐    ┌──────────────────────┐    ┌─────────────────────┐
│   VS Code       │    │   Docker Container   │    │   Terminal (CLI)    │
│   - Extensões   │────│   SQL Server Linux   │────│   sqlcmd            │
│   - IntelliSense│    │   - Porta 1433       │    │   - Consultas       │
│   - Visualização│    │   - Database: Filmes │    │   - Administração   │
└─────────────────┘    └──────────────────────┘    └─────────────────────┘
```

## Tecnologias Utilizadas

- **Docker Desktop**: Containerização do SQL Server
- **SQL Server 2022 Linux**: Banco de dados em container
- **Visual Studio Code**: IDE principal
- **MSSQL extension for Visual Studio Code**: Interface gráfica para SQL
- **macOS**: Sistema operacional base
- **Terminal macOS**: Alternativa simplificada de consulta

## Execução - Método VS Code (Interface Gráfica)

A implementação via VS Code oferece uma experiência visual completa com recursos avançados:

### Funcionalidades Demonstradas
- **IntelliSense**: Autocomplete e validação de sintaxe via MSSQL extension
- **Visualização de Resultados**: Tabelas formatadas com ordenação
- **Navegação de Schema**: Explorador de banco de dados integrado
- **Execução de Consultas**: Interface intuitiva com botões de ação

### Exemplos de Execução no VS Code

**Imagem 1: Consulta Básica - SELECT Nome, Ano FROM Filmes**
![VS Code - Consulta 1](Image1)
*Visualização da primeira consulta mostrando lista completa de filmes com nome e ano, resultado apresentado em tabela formatada*

**Imagem 2: Consulta com JOIN - Filmes e Gêneros**  
![VS Code - Consulta com JOIN](Image2)
*Demonstração de consulta complexa com INNER JOIN entre tabelas Filmes e Generos, exibindo relacionamentos*

**Imagem 3: Consulta Filtrada - Gênero Mistério**
![VS Code - Filtro por Gênero](Image3)
*Consulta específica filtrando filmes do gênero "Mistério" usando WHERE clause*

### Recursos Destacados no VS Code
- Interface clean e moderna
- Resultados organizados em colunas ordenáveis
- Contagem de registros retornados
- Tempo de execução das consultas
- Integração com Git para versionamento

## Execução - Método Terminal (Linha de Comando)

A implementação via terminal oferece performance superior e controle granular:

### Vantagens da Execução CLI
- **Performance**: Execução direta sem overhead de interface
- **Controle**: Acesso completo às funcionalidades do SQL Server
- **Automação**: Ideal para scripts e execução em lote
- **Compatibilidade**: 100% compatível com comandos SSMS

### Exemplo de Execução no Terminal

**Imagem 4: Execução via sqlcmd**
![Terminal - sqlcmd](Image4)
*Demonstração da execução via terminal mostrando conexão Docker, consulta SQL e resultados em formato texto*

### Comandos Utilizados
```bash
# Conexão ao container SQL Server
docker exec sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P password

# Execução do Script Filmes
USE Filmes; 

# Exemplo de consulta
SELECT TOP 10 Nome, Ano, Duracao FROM Filmes ORDER BY Ano;
```

## Diagrama de Fluxo da Solução

**Imagem 5: Arquitetura Visual**
![Diagrama de Arquitetura](Image5)
*Diagrama mostrando a conexão entre VS Code, Terminal e SQL Server via Docker*

## Resultados Alcançados

### Consultas Implementadas com Sucesso
- ✅ **12 consultas DIO** executadas completamente
- ✅ **JOINs complexos** entre múltiplas tabelas
- ✅ **Filtros e ordenação** funcionando corretamente
- ✅ **Agregações e agrupamentos** validados

### Comparação de Performance

| Método | Tempo Resposta | Interface | Flexibilidade |
|--------|---------------|-----------|---------------|
| VS Code | ~100-200ms | ★★★★★ | ★★★★☆ |
| Terminal | ~50-100ms | ★★☆☆☆ | ★★★★★ |

## Vantagens da Solução

### Benefícios Técnicos
- **Multiplataforma**: Executável em qualquer sistema operacional
- **Isolamento**: Ambiente containerizado e reproduzível
- **Flexibilidade**: Duas interfaces para diferentes necessidades
- **Performance**: Tempo de resposta adequado para desenvolvimento

### Benefícios de Produtividade  
- **IntelliSense**: Redução de erros de sintaxe
- **Visualização**: Resultados organizados e legíveis
- **Portabilidade**: Configuração facilmente replicável
- **Integração**: Compatível com ferramentas de desenvolvimento modernas

## Conclusão

A solução implementada demonstrou ser uma alternativa **completa e eficaz** ao SSMS para desenvolvedores macOS. A combinação de Docker + VS Code + Terminal oferece:

- **Funcionalidade equivalente** ao ambiente Windows/SSMS
- **Experiência de desenvolvimento moderna** com ferramentas atuais
- **Flexibilidade** entre interface gráfica e linha de comando
- **Reprodutibilidade** através de containerização

Esta abordagem foi desenvolvida em resposta à **necessidade de utilizar SQL Server em ambiente macOS**, considerando a ausência de sistema operacional Windows no ambiente de desenvolvimento. A solução implementada demonstrou **alta eficácia** e é recomendada para estudantes e profissionais que enfrentem cenário similar, oferecendo uma experiência de desenvolvimento robusta e compatível com padrões profissionais de mercado.

## Especificações Técnicas

- **Sistema Operacional**: macOS  
- **Container**: mcr.microsoft.com/mssql/server:2022-latest
- **Conexão**: localhost:1433
- **Database**: Filmes (criado via Script Filmes.sql)
- **Autenticação**: SQL Server Authentication (sa)
- **Extensão**: MSSQL extension for Visual Studio Code