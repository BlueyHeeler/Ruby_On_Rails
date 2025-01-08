document.addEventListener("DOMContentLoaded", () => {
    const addMovieBtn = document.getElementById("add-movie-btn");
    const moviesContainer = document.getElementById("movies-container");

    addMovieBtn.addEventListener("click", () => {
        const movieForm = document.querySelector(".movie-form");
        const newForm = movieForm.cloneNode(true);

        // Limpa os valores dos campos no formulário clonado
        newForm.querySelectorAll("input, textarea").forEach((field) => {
            field.value = "";
        });

        // Adiciona o novo formulário ao container
        moviesContainer.appendChild(newForm);
    });
});
