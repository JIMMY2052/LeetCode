Select  distinct p1.email as Email   
From Person p1 , Person p2
Where p1.email = p2.email and p1.id <> p2.id;