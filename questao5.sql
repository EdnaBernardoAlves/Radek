SELECT IIF (n.nota <= 8, null, a.nome) nome, a.nome, n.nota, a.valor from alunos a, nota n
where a.valor >= n.valor_min
and a.valor <= n.valor_max
order by  N.NOTA DESC, a.nome