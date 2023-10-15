const btnAgregarPerfil = document.getElementById('btnAgregarPerfil');
const modalAgregarPerfil = document.getElementById('modalAgregarPerfil');

btnAgregarPerfil.addEventListener('click', () => {
    modalAgregarPerfil.style.display = 'block';
});

window.onclick = (event) => {
    if (event.target === modalAgregarPerfil) {
        modalAgregarPerfil.style.display = 'none';
    }
};






