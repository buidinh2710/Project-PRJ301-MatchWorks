/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*-----------------------------------HEADER--------------------------------------*/
(() => {
    const dds = document.querySelectorAll('.mw-dd');
    const overlay = document.querySelector('.mw-overlay');
    const burger = document.querySelector('.mw-burger');
    const nav = document.querySelector('.mw-nav');

    const isMobile = () => window.matchMedia('(max-width: 980px)').matches;

    function closeAll(except = null) {
        dds.forEach(dd => {
            if (dd !== except)
                dd.classList.remove('is-open');
            const btn = dd.querySelector('[data-dd-trigger]');
            if (btn)
                btn.setAttribute('aria-expanded', dd.classList.contains('is-open') ? 'true' : 'false');
        });

        const anyOpen = [...dds].some(dd => dd.classList.contains('is-open'));
        if (overlay)
            overlay.hidden = !anyOpen || isMobile();
    }

    function openDD(dd) {
        closeAll(dd);
        dd.classList.add('is-open');
        const btn = dd.querySelector('[data-dd-trigger]');
        if (btn)
            btn.setAttribute('aria-expanded', 'true');

        if (overlay)
            overlay.hidden = isMobile(); // desktop mới cần overlay
    }

    // Desktop: hover/focus -> open
    dds.forEach(dd => {
        const trigger = dd.querySelector('[data-dd-trigger]');
        const panel = dd.querySelector('[data-dd-panel]');

        let closeTimeout;

        // Hover open (desktop)
        dd.addEventListener('mouseenter', () => {
            if (!isMobile()) {
                clearTimeout(closeTimeout);   // huỷ đóng nếu đang đếm
                openDD(dd);
            }
        });

        // Hover leave -> delay đóng
        dd.addEventListener('mouseleave', () => {
            if (!isMobile()) {
                closeTimeout = setTimeout(() => {
                    closeAll();
                }, 180); // 👈 chỉnh 150–250ms tuỳ bạn
            }
        });

        // Mobile: click toggle
        trigger?.addEventListener('click', () => {
            if (!isMobile())
                return;
            const isOpen = dd.classList.contains('is-open');
            if (isOpen) {
                dd.classList.remove('is-open');
                trigger.setAttribute('aria-expanded', 'false');
            } else {
                openDD(dd);
            }
        });
    });



// Burger open/close nav (mobile)
burger?.addEventListener('click', () => {
    const open = nav.classList.toggle('is-mobile-open');
    burger.setAttribute('aria-expanded', open ? 'true' : 'false');
    if (!open)
        closeAll();
});

// Resize: reset states
window.addEventListener('resize', () => {
    overlay.hidden = true;
    closeAll();
    if (!isMobile()) {
        nav.classList.remove('is-mobile-open');
        burger?.setAttribute('aria-expanded', 'false');
        }
    }
    );
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


