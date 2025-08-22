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

<br>
Exercício 01 - Consulta Básica - SELECT Nome, Ano FROM Filmes: Visualização da primeira consulta mostrando lista completa de filmes com nome e ano, resultado apresentado em tabela formatada.

<img width="1680" height="1050" alt="01" src="https://github.com/user-attachments/assets/acd3e6b4-2fdd-40b1-8c26-59bced107b61" />
<br>
<br>

**Exercício 10 - Consulta com JOIN - Filmes e Gêneros** 
*Demonstração de consulta complexa com INNER JOIN entre tabelas Filmes e Generos, exibindo relacionamentos*

<img width="1673" height="1003" alt="10" src="https://github.com/user-attachments/assets/f251574a-fe55-4f88-bdcd-e97dd75745db" />
<br>
<br>

**Exercício 11 - Consulta Filtrada - Gênero Mistério**
*Consulta específica filtrando filmes do gênero "Mistério" usando WHERE clause*

<img width="1680" height="1050" alt="11" src="https://github.com/user-attachments/assets/b86bc04d-1b69-490a-a196-6794b625bf3d" />
<br>

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

**Execução via sqlcmd**
*Demonstração da execução via terminal mostrando conexão Docker, consulta SQL e resultados em formato texto*

<br>
<img width="593" height="382" alt="Captura de Tela 2025-08-21 às 18 38 42" src="https://github.com/user-attachments/assets/c5a222f0-25e0-4c06-81c0-77c55e0398c2" />
<br>


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
**Arquitetura Visual**

<img width="726" height="161" alt="Captura de Tela 2025-08-21 às 18 40 48" src="https://github.com/user-attachments/assets/505d9941-61d7-4b63-a3bd-db3d82da00ad" />
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

---

**Bootcamp WEX - End to End Engineering - DIO**  
Desenvolvido por [Natalia Moraes](https://www.linkedin.com/in/moraesnatalia/)
