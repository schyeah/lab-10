async function login() {
  const res = await fetch("http://localhost:8080/auth/login", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      username: "admin",
      password: "1234"
    })
  });

  const data = await res.json();
  localStorage.setItem("token", data.token);
}
async function getProfile() {

  const token = localStorage.getItem("token");

  const res = await fetch("http://localhost:8080/api/profile", {
    headers: {
      "Authorization": "Bearer " + token
    }
  });

  const data = await res.text();
  console.log(data);
}