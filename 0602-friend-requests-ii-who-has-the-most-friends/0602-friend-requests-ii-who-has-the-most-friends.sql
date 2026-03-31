select requester_id as id
    from requestaccepted

    union all

    select accepter_id as id
    from requestaccepted