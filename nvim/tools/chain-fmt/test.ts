const result = await db.select()
.from(users)
.where(eq(users.email, email));
