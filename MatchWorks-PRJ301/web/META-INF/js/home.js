/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*------------------------------------- HEADER ---------------------------------------*/
(() => {
  const dropdowns = document.querySelectorAll('.mw-dd');
  const burger = document.querySelector('.mw-burger');
  const nav = document.querySelector('.mw-nav');
  const backdrop = document.querySelector('.mw-backdrop');

  const isMobile = () => window.matchMedia('(max-width: 980px)').matches;

  function setAria(dd){
    const trigger = dd.querySelector('[data-dd-trigger]');
    if (!trigger) return;
    trigger.setAttribute('aria-expanded', dd.classList.contains('is-open') ? 'true' : 'false');
  }

  function closeAllDropdowns(except=null){
    dropdowns.forEach(dd => {
      if (dd !== except) dd.classList.remove('is-open');
      setAria(dd);
    });
  }

  function openDropdown(dd){
    closeAllDropdowns(dd);
    dd.classList.add('is-open');
    setAria(dd);
  }

  function openDrawer(){
    nav.classList.add('is-mobile-open');
    burger.classList.add('is-open');
    burger.setAttribute('aria-expanded','true');
    if (backdrop) backdrop.hidden = false;
    document.body.style.overflow = 'hidden';
  }

  function closeDrawer(){
    nav.classList.remove('is-mobile-open');
    burger.classList.remove('is-open');
    burger.setAttribute('aria-expanded','false');
    if (backdrop) backdrop.hidden = true;
    document.body.style.overflow = '';
    closeAllDropdowns();
  }

  // Desktop: hover dropdown
  dropdowns.forEach(dd => {
    const trigger = dd.querySelector('[data-dd-trigger]');
    let closeTimer = null;

    dd.addEventListener('mouseenter', () => {
      if (isMobile()) return;
      if (closeTimer) clearTimeout(closeTimer);
      openDropdown(dd);
    });

    dd.addEventListener('mouseleave', () => {
      if (isMobile()) return;
      closeTimer = setTimeout(() => closeAllDropdowns(), 180);
    });

    // Mobile: click accordion
    trigger?.addEventListener('click', () => {
      if (!isMobile()) return;
      const willOpen = !dd.classList.contains('is-open');
      if (willOpen) openDropdown(dd);
      else {
        dd.classList.remove('is-open');
        setAria(dd);
      }
    });
  });

  // Burger toggle
  burger?.addEventListener('click', () => {
    const isOpen = nav.classList.contains('is-mobile-open');
    if (isOpen) closeDrawer();
    else openDrawer();
  });

  // Backdrop click closes
  backdrop?.addEventListener('click', closeDrawer);

  // Click outside closes (mobile)
  document.addEventListener('click', (e) => {
    if (!isMobile()) return;
    if (!nav.classList.contains('is-mobile-open')) return;

    const clickInsideNav = nav.contains(e.target);
    const clickBurger = burger.contains(e.target);
    const clickBackdrop = backdrop && backdrop.contains(e.target);

    if (!clickInsideNav && !clickBurger && !clickBackdrop) closeDrawer();
  });

  // Resize reset
  window.addEventListener('resize', () => {
    closeAllDropdowns();
    if (!isMobile()) {
      // ensure drawer closed when back to desktop
      nav.classList.remove('is-mobile-open');
      burger?.classList.remove('is-open');
      burger?.setAttribute('aria-expanded','false');
      if (backdrop) backdrop.hidden = true;
      document.body.style.overflow = '';
    }
  });

  // ESC close
  window.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeDrawer();
  });
})();

/*-----------------------------------CONG VIEC NOI BAT--------------------------------------*/
document.addEventListener("DOMContentLoaded", function () {

    const filterType = document.getElementById("filterType");
    const filterOptions = document.getElementById("filterOptions");

    if (!filterType || !filterOptions) {
        console.error("Không tìm thấy filterType hoặc filterOptions");
        return;
    }

    const salaryOptions = [
        "Tất cả",
        "Dưới 10 triệu",
        "10 - 20 triệu",
        "20 - 30 triệu",
        "30 - 50 triệu",
        "Trên 50 triệu",
        "Thỏa thuận"
    ];

    const expOptions = [
        "Tất cả",
        "Dưới 1 năm",
        "1 năm",
        "2 năm",
        "3 năm",
        "Trên 3 năm"
    ];

    function renderFilters(type) {
        const options = type === "salary" ? salaryOptions : expOptions;
        filterOptions.innerHTML = "";

        options.forEach((text, index) => {
            const chip = document.createElement("button");
            chip.type = "button";
            chip.className = "filter-chip" + (index === 0 ? " active" : "");
            chip.textContent = text;

            chip.addEventListener("click", function () {
                document.querySelectorAll(".filter-chip")
                        .forEach(c => c.classList.remove("active"));
                chip.classList.add("active");
            });

            filterOptions.appendChild(chip);
        });
    }

    filterType.addEventListener("change", function () {
        renderFilters(filterType.value);
    });

    renderFilters("salary");
});

/*----------------------------------- COMPANY --------------------------------------*/
document.addEventListener("DOMContentLoaded", () => {
    const tabsScroll = document.getElementById("tabsScroll");
    const tabs = document.querySelectorAll(".tab");
    const cards = document.querySelectorAll(".company-card");

    // arrows
    const arrows = document.querySelectorAll(".tab-arrow");
    if (arrows.length === 2 && tabsScroll) {
        arrows[0].addEventListener("click", () => tabsScroll.scrollBy({left: -220, behavior: "smooth"}));
        arrows[1].addEventListener("click", () => tabsScroll.scrollBy({left: 220, behavior: "smooth"}));
    }

    function setActive(tab) {
        tabs.forEach(t => t.classList.remove("active"));
        tab.classList.add("active");
    }

    function filter(cat) {
        cards.forEach(card => {
            const c = card.dataset.cat || "all";
            card.style.display = (cat === "all" || c === cat) ? "" : "none";
        });
    }

    tabs.forEach(tab => {
        tab.addEventListener("click", () => {
            const cat = tab.dataset.cat;
            setActive(tab);
            filter(cat);
        });
    });
});


