const liensDuProjet = {
  cagnotte: "https://app.lacagnottedesproches.fr/cagnotte/histoire-des-armeniens-de-stanoze/",
  livrePdf: "https://memoire-stanoze.org/wp-content/uploads/2026/06/Garabed-Terzian-Stanoze-version-complete-avec-photos-beta.pdf"
};

const boutonMenu = document.querySelector(".menu-toggle");
const navigation = document.querySelector("#navigation-principale");

function appliquerLesLiens() {
  document.querySelectorAll("[data-link]").forEach((link) => {
    const lien = link.dataset.link;
    if (liensDuProjet[lien]) {
      link.href = liensDuProjet[lien];
    }
  });
}

function activerLeMenuMobile() {
  if (!boutonMenu || !navigation) return;

  boutonMenu.addEventListener("click", () => {
    const menuOuvert = navigation.classList.toggle("open");
    boutonMenu.setAttribute("aria-expanded", String(menuOuvert));
  });

  navigation.addEventListener("click", (event) => {
    if (event.target.matches("a")) {
      navigation.classList.remove("open");
      boutonMenu.setAttribute("aria-expanded", "false");
    }
  });
}

appliquerLesLiens();
activerLeMenuMobile();
