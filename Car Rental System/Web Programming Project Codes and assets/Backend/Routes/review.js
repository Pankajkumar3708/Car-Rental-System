let currentPage = 1;
let sortOrder = "latest";

// **Fetch and Display Reviews**
function fetchReviews() {
    fetch(`http://localhost:5000/getReviews?page=${currentPage}&sort=${sortOrder}`)
        .then(response => response.json())
        .then(data => {
            let reviewsContainer = document.getElementById("reviews-container");
            reviewsContainer.innerHTML = ""; // Clear previous content

            data.forEach(review => {
                reviewsContainer.innerHTML += `
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5>${review.user_name} <span class="badge bg-success">${review.rating}/5</span></h5>
                            <p>${review.review_text}</p>
                            <small class="text-muted">Reviewed on ${new Date(review.created_at).toLocaleDateString()}</small>
                        </div>
                    </div>
                `;
            });

            updatePagination();
        })
        .catch(error => console.error("Error fetching reviews:", error));
}

// **Submit New Review**
document.getElementById("review-form").addEventListener("submit", function(event) {
    event.preventDefault();

    let userId = document.getElementById("user-id").value;
    let vehicleId = document.getElementById("vehicle-id").value;
    let rating = document.getElementById("rating").value;
    let reviewText = document.getElementById("review-text").value;

    fetch("http://localhost:5000/addReview", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ user_id: userId, vehicle_id: vehicleId, rating, review_text: reviewText })
    })
    .then(response => response.json())
    .then(() => {
        alert("Review added successfully!");
        fetchReviews();
        document.getElementById("review-form").reset();
    })
    .catch(error => console.error("Error adding review:", error));
});

// **Sorting**
document.getElementById("sort-reviews").addEventListener("change", function() {
    sortOrder = this.value;
    fetchReviews();
});

// **Pagination**
function updatePagination() {
    let pagination = document.getElementById("pagination");
    pagination.innerHTML = "";

    for (let i = 1; i <= 9; i++) {
        pagination.innerHTML += `<li class="page-item ${i === currentPage ? "active" : ""}">
            <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
        </li>`;
    }
}

function changePage(page) {
    currentPage = page;
    fetchReviews();
}

// **Load Reviews on Page Load**
fetchReviews();
