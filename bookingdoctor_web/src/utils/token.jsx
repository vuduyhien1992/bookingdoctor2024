const userData = {
    user: {
      id: 2,
      email: "user@gmail.com",
      roles: ["USER"],
    },
    accessToken:
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyIiwicm9sZXMiOiJVU0VSIiwiZXhwIjoxNzEzNjExNjkwfQ.pX0Pgsd--J7WmqHt8ZuVfZVx3XmdiVeYwxqeyaN4iQ7I6a-bjLjPsFKdzzggPfvAM66L2kR2XFjuRwQ-tEy_Zw",
    refreshToken: "33c8659f-9f28-4bac-96fc-9cf1d0295495",
    expiredAt: [2024, 4, 20, 18, 14, 50, 125040200],
};
  // sessionStorage.setItem("Token", JSON.stringify(userData));
  const getUserData = JSON.parse(sessionStorage.getItem("Token"));
  
  export default getUserData;