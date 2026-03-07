/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*------------------------------------- HEADER ---------------------------------------*/
document.addEventListener("DOMContentLoaded", () => {
  const dropdowns = Array.from(document.querySelectorAll(".nav-dropdown"));
  const burger = document.querySelector(".nav-toggle");
  const nav = document.querySelector(".primary-nav");
  const backdrop = document.querySelector(".nav-backdrop");

  if (!burger || !nav) return;

  const isMobile = () => window.matchMedia("(max-width: 980px)").matches;

  const setAria = (dd) => {
    const btn = dd.querySelector("[data-dd-trigger]");
    if (btn) btn.setAttribute("aria-expanded", dd.classList.contains("is-open") ? "true" : "false");
  };

  const closeDropdown = (dd) => {
    dd.classList.remove("is-open");
    setAria(dd);
  };

  const closeAllDropdowns = (except = null) => {
    dropdowns.forEach((dd) => {
      if (dd !== except) closeDropdown(dd);
    });
  };

  const toggleDropdown = (dd, forceOpen = null) => {
    const willOpen = forceOpen ?? !dd.classList.contains("is-open");
    closeAllDropdowns(dd);
    if (willOpen) dd.classList.add("is-open");
    else dd.classList.remove("is-open");
    setAria(dd);
  };

  const openDrawer = () => {
    nav.classList.add("is-mobile-open");
    burger.classList.add("is-open");
    burger.setAttribute("aria-expanded", "true");
    if (backdrop) backdrop.hidden = false;
    document.body.style.overflow = "hidden";
  };

  const closeDrawer = () => {
    nav.classList.remove("is-mobile-open");
    burger.classList.remove("is-open");
    burger.setAttribute("aria-expanded", "false");
    if (backdrop) backdrop.hidden = true;
    document.body.style.overflow = "";
    closeAllDropdowns();
  };

  // ===== Dropdown events =====
  dropdowns.forEach((dd) => {
    const btn = dd.querySelector("[data-dd-trigger]");
    const panel = dd.querySelector("[data-dd-panel]");
    if (!btn) return;

    let closeTimer = null;

    // Desktop hover
    dd.addEventListener("mouseenter", () => {
      if (isMobile()) return;
      if (closeTimer) clearTimeout(closeTimer);
      toggleDropdown(dd, true);
    });

    dd.addEventListener("mouseleave", () => {
      if (isMobile()) return;
      closeTimer = setTimeout(() => closeAllDropdowns(), 180);
    });

    // Click: mobile accordion / desktop click toggle
    btn.addEventListener("click", (e) => {
      e.stopPropagation();

      if (isMobile()) {
        // chỉ cho mở dropdown khi drawer đang mở (tránh click lung tung)
        if (!nav.classList.contains("is-mobile-open")) return;
        toggleDropdown(dd);
      } else {
        // desktop click để mở/đóng (hữu ích khi không muốn hover)
        toggleDropdown(dd);
      }
    });

    // click bên trong panel không đóng
    panel?.addEventListener("click", (e) => e.stopPropagation());
  });

  // ===== Burger =====
  burger.addEventListener("click", (e) => {
    e.stopPropagation();
    nav.classList.contains("is-mobile-open") ? closeDrawer() : openDrawer();
  });

  // Backdrop click closes
  backdrop?.addEventListener("click", closeDrawer);

  // Click outside
  document.addEventListener("click", (e) => {
    if (isMobile()) {
      // Mobile: nếu drawer mở mà click ngoài -> đóng
      if (!nav.classList.contains("is-mobile-open")) return;
      if (!nav.contains(e.target) && !burger.contains(e.target) && !(backdrop && backdrop.contains(e.target))) {
        closeDrawer();
      }
    } else {
      // Desktop: click ngoài -> đóng dropdown
      closeAllDropdowns();
    }
  });

  // Resize reset
  window.addEventListener("resize", () => {
    closeAllDropdowns();
    if (!isMobile()) closeDrawer(); // về desktop thì đóng drawer
  });

  // ESC close
  window.addEventListener("keydown", (e) => {
    if (e.key !== "Escape") return;
    closeAllDropdowns();
    closeDrawer();
  });
});






const btn = document.getElementById("saveBtn");
btn.addEventListener("click", () => {
    const next = !btn.classList.contains("is-saved");
    btn.classList.toggle("is-saved", next);
    btn.setAttribute("aria-pressed", String(next));
    btn.querySelector(".save-ico").textContent = next ? "♥" : "♡";
    btn.querySelector(".save-text").textContent = next ? "Đã lưu" : "Lưu tin";
});