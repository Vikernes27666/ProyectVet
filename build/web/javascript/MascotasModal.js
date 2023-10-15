const btnAgregarMascota = document.getElementById('btnAgregarMascota');
const modalAgregarMascota = document.getElementById('modalAgregarMascota');

btnAgregarMascota.addEventListener('click', () => {
    modalAgregarMascota.style.display = 'block';
});

window.onclick = (event) => {
    if (event.target === modalAgregarMascota) {
        modalAgregarMascota.style.display = 'none';
    }
};


