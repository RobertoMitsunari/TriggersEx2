# TriggersEx2
Exercício 2 de Triggers da matéria Lab de Banco de Dados

- Uma empresa vende produtos alimentícios
- A empresa dá pontos, para seus clientes, que podem ser revertidos em prêmios
- Para não prejudicar a tabela venda, nenhum produto pode ser deletado, mesmo que não venha mais a ser vendido
- Para não prejudicar os relatórios e a contabilidade, a tabela venda não pode ser alterada. 
- Ao invés de alterar a tabela venda deve-se exibir uma tabela com o nome do último cliente que comprou e o valor da 
última compra
- Após a inserção de cada linha na tabela venda, 10% do total deverá ser transformado em pontos.
- Se o cliente ainda não estiver na tabela de pontos, deve ser inserido automaticamente após sua primeira compra
- Se o cliente atingir 1 ponto, deve receber uma mensagem dizendo que ganhou
Tabela Cliente (Codigo | Nome)

Tabela Venda (Codigo_Venda | Codigo_Cliente | Valor_Total)

Tabela Pontos (Codigo_Cliente | Total_Pontos)
