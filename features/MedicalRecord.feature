Feature: medical record
    As membro do grupo de usuários médicos
    I want adicionar diferentes tipos de prontuários e editá-los
    So that consigo gerar um prontuário completo sobre meu paciente que ajude eu e outros médicos no diagnóstico e tratamento do paciente

    Scenario: adicionar atendimento
        Given estou logado como médico
        And estou na página "Meus pacientes"
        And "Lucas Grisi" é meu paciente
        When seleciono o paciente "Lucas Grisi"
        And seleciono "adicionar atendimento"
        Then sou direcionado para a aba de "Atendimentos" do paciente 
        And preencho os campos de "Altura" e "Peso" com "175cm" e "70kg"
        And na seção de "Queixas" preencho "QPD", "HDA" e "IS" com "Muita dor de cabeça e enjoo", "Durante 1 semana com sintomas" e "O que você está sentindo? Por quanto tempo? Alguém próximo está sentindo o mesmo?"
        And na seção de "Antecedentes familiares e pessoais" preencho "Mãe já teve crise de enxaqueca por 2 anos"
        And na seção de "Hipótese Diagnóstica" preencho "Virose comum"
        And na seção de "Conduta" preencho "Uso de medicamento prescrito na receita"
        When seleciono "Salvar"
        Then o atendimento é salvo no sistema 

    Scenario: adicionar receita
        Given estou logado como médico
        And estou na página "Meus pacientes"
        And "Lucas Grisi" é meu paciente
        When seleciono o paciente "Lucas Grisi"
        And seleciono a aba de "receitas"
        And adiciono uma nova receita 
        And preencho os campos de "Medicamento", "Uso", "Duração", "Quantidade" e "Frequencia" com "Tylenol","Oral","1 semana", "200mg", "8 em 8 horas"
        And peço para adicionar 
        Then a receita é salva no sistema 
        And posso ver o histórico de receitas do paciente 
    
    Scenario: editar receita 
        Given estou logado como médico
        And estou na página "Meus pacientes"
        And "Lucas Grisi" é meu paciente
        And a receita do dia "02/01/2020" foi feita por mim
        When seleciono o paciente "Lucas Grisi"
        And seleciono a aba de "receitas"
        And peço para editar a receita do dia "02/01/2020"
        And edito o campo de "Frequencia" de "8 em 8 horas" para "6 em 6 horas" 
        Then a nova versão da receita é salva no sistema
    
    Scenario: editar receita fail 
        Given estou logado como médico
        And estou na página "Meus pacientes"
        And "Luís Albuquerque" é meu paciente 
        When seleciono o paciente "Lucas Grisi"
        And seleciono a aba de "receitas"
        And peço para editar a receita do dia "03/03/2021"
        Then recebo uma mensagem de erro sinalizando que apenas o autor da receita pode editá-la 
        And continuo na aba de "receitas"

    Scenario: adicionar exame 
        Given estou logado como médico
        And estou na página "Meus pacientes"
        And "Lucas Grisi" é meu paciente
        When seleciono o paciente "Lucas Grisi"
        And seleciono a aba de "exames"
        And adiciono o exame "Raio-X.pdf" do meu computador 
        Then o exame é adicionado no prontuário do paciente 
        And posso ver o histórico de exames do paciente 
    
    Scenario: adicionar exame fail 
        Given estou logado como médico
        And estou na página "Meus pacientes"
        And "Lucas Grisi" é meu paciente
        When seleciono o paciente "Lucas Grisi"
        And seleciono a aba de "exames"
        And adiciono o exame "Raio-X.bat" do meu computador 
        Then recebo um alerta de erro sobre o formato do arquivo
