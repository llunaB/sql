# 부모 노드 미존재
select id, 'Root' as type from tree
where p_id is null

union

# 누군가의 부모 노드이면서 부모 노드가 존재
select id, 'Inner' as type from tree
where id in (
select distinct p_id from tree
where p_id is not null
) and p_id is not null

union

# 누군가의 부모노드가 아니면서 부모노드가 존재
select id, 'Leaf' as type from tree
where id not in (
select distinct p_id from tree
where p_id is not null
) and p_id is not null




-----------------
SELECT
    id, 'Root' AS Type
FROM
    tree
WHERE
    p_id IS NULL


SELECT
    id, 'Leaf' AS Type
FROM
    tree
WHERE
    id NOT IN (SELECT DISTINCT
            p_id
        FROM
            tree
        WHERE
            p_id IS NOT NULL)
        AND p_id IS NOT NULL


SELECT
    id, 'Inner' AS Type
FROM
    tree
WHERE
    id IN (SELECT DISTINCT
            p_id
        FROM
            tree
        WHERE
            p_id IS NOT NULL)
        AND p_id IS NOT NULL