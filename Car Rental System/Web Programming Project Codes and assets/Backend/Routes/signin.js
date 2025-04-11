document.querySelector(".signin-form").addEventListener("submit", async function (event) {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    if (!email || !password) {
        alert("Please fill in all fields");
        return;
    }

    try {
        const response = await fetch("http://localhost:5000/signin", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, password })
        });

        const data = await response.json();

        if (!response.ok) {
            alert(data.error);
            return;
        }

        // ✅ Save user info in localStorage
        localStorage.setItem("user", JSON.stringify(data.user));

        // ✅ Redirect based on role
        if (data.user.role === "admin") {
            alert("Welcome Admin!");
            setTimeout(() => {
                window.location.href = "../Admin Panel/admin.html"; // Redirect to Admin Panel
            }, 1000);
        } else {
            alert("Login Successful!");
            setTimeout(() => {
                window.location.href = "../Home Page/index.html"; // Redirect to Home Page
            }, 1000);
        }

    } catch (error) {
        console.error("Error during sign-in:", error);
        alert("Something went wrong, please try again");
    }
});
