var Login = createReactClass({
  
  render: function() {
    return (
      <React.Fragment>
        <form method="POST" action="">
          <label>Username:</label>
          <input type="text" name="username" placeholder="write your username..."/>
          <label>Password:</label>
          <input type="password" name="password" placeholder="write your password..."/>
          <a href="">new here?</a>
          <input type="submit" value="Login" />
        </form>
      </React.Fragment>
    );
  }
});

