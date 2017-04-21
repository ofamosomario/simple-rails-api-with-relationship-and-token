User.create([
	{email: 'user1@user.com.br' , password: '123mudar' , password_confirmation: '123mudar' , name: 'Mario Augusto'},
	{email: 'user2@user.com.br' , password: '123mudar' , password_confirmation: '123mudar' , name: 'Jonh Potato'},
	{email: 'user3@user.com.br' , password: '123mudar' , password_confirmation: '123mudar' , name: 'Erik Pepper'},
	{email: 'user4@user.com.br' , password: '123mudar' , password_confirmation: '123mudar' , name: 'Melissa Guentz'},
	{email: 'user5@user.com.br' , password: '123mudar' , password_confirmation: '123mudar' , name: 'Renata Silver'}
])

Relationship.create([
	{follower_id: 1 , followed_id: 2 , status: 2},
	{follower_id: 1 , followed_id: 3 , status: 2},
	{follower_id: 1 , followed_id: 4 , status: 2},
	{follower_id: 1 , followed_id: 5 , status: 3},

	{follower_id: 2 , followed_id: 3 , status: 2},
	{follower_id: 2 , followed_id: 4 , status: 3},

])

Post.create([
	{message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' , user_id: 1},
	{message: 'Vestibulum mattis odio et arcu feugiat pretium.' , user_id: 1},
	{message: 'Proin sed tincidunt risus. Sed sollicitudin porttitor quam, at facilisis odio feugiat quis.' , user_id: 1},
	{message: 'Suspendisse iaculis lacus dapibus arcu tincidunt bibendum.' , user_id: 1},

	{message: 'Aliquam aliquet ut mauris quis commodo.' , user_id: 2},
	{message: 'Praesent nec enim eget felis congue tincidunt sed vel lacus.' , user_id: 2},
	{message: 'Praesent leo risus, ultrices a elit ac, ultrices facilisis orci.' , user_id: 2},

	{message: 'Suspendisse in ante tincidunt, tristique neque vel, feugiat justo.' , user_id: 3},
	{message: 'Nullam ultrices sapien quis dolor tristique dignissim.' , user_id: 3},

	{message: 'Aliquam faucibus non dui id scelerisque. Vestibulum porttitor tincidunt massa, vel feugiat tellus.' , user_id: 4},

	{message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' , user_id: 5},
])