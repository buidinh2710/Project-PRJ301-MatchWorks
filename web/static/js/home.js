/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*--------------------------------------------- HEADER -------------------------------------------------*/
document.addEventListener("DOMContentLoaded", () => {
    const dropdowns = Array.from(document.querySelectorAll(".nav-dropdown"));
    const burger = document.querySelector(".nav-toggle");
    const nav = document.querySelector(".primary-nav");
    const backdrop = document.querySelector(".nav-backdrop");

    if (!burger || !nav)
        return;

    const isMobile = () => window.matchMedia("(max-width: 980px)").matches;

    const setAria = (dd) => {
        const btn = dd.querySelector("[data-dd-trigger]");
        if (btn)
            btn.setAttribute("aria-expanded", dd.classList.contains("is-open") ? "true" : "false");
    };

    const closeDropdown = (dd) => {
        dd.classList.remove("is-open");
        setAria(dd);
    };

    const closeAllDropdowns = (except = null) => {
        dropdowns.forEach((dd) => {
            if (dd !== except)
                closeDropdown(dd);
        });
    };

    const toggleDropdown = (dd, forceOpen = null) => {
        const willOpen = forceOpen ?? !dd.classList.contains("is-open");
        closeAllDropdowns(dd);
        if (willOpen)
            dd.classList.add("is-open");
        else
            dd.classList.remove("is-open");
        setAria(dd);
    };

    const openDrawer = () => {
        nav.classList.add("is-mobile-open");
        burger.classList.add("is-open");
        burger.setAttribute("aria-expanded", "true");
        if (backdrop)
            backdrop.hidden = false;
        document.body.style.overflow = "hidden";
    };

    const closeDrawer = () => {
        nav.classList.remove("is-mobile-open");
        burger.classList.remove("is-open");
        burger.setAttribute("aria-expanded", "false");
        if (backdrop)
            backdrop.hidden = true;
        document.body.style.overflow = "";
        closeAllDropdowns();
    };

    // ===== Dropdown events =====
    dropdowns.forEach((dd) => {
        const btn = dd.querySelector("[data-dd-trigger]");
        const panel = dd.querySelector("[data-dd-panel]");
        if (!btn)
            return;

        let closeTimer = null;

        // Desktop hover
        dd.addEventListener("mouseenter", () => {
            if (isMobile())
                return;
            if (closeTimer)
                clearTimeout(closeTimer);
            toggleDropdown(dd, true);
        });

        dd.addEventListener("mouseleave", () => {
            if (isMobile())
                return;
            closeTimer = setTimeout(() => closeAllDropdowns(), 180);
        });

        // Click: mobile accordion / desktop click toggle
        btn.addEventListener("click", (e) => {
            e.stopPropagation();

            if (isMobile()) {
                // chỉ cho mở dropdown khi drawer đang mở (tránh click lung tung)
                if (!nav.classList.contains("is-mobile-open"))
                    return;
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
            if (!nav.classList.contains("is-mobile-open"))
                return;
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
        if (!isMobile())
            closeDrawer(); // về desktop thì đóng drawer
    });

    // ESC close
    window.addEventListener("keydown", (e) => {
        if (e.key !== "Escape")
            return;
        closeAllDropdowns();
        closeDrawer();
    });
});

/*------------------------------------------- COMPANY ----------------------------------------------*/
document.addEventListener("DOMContentLoaded", () => {
    const tabsScroll = document.getElementById("tabsScroll");
    const tabs = document.querySelectorAll(".company-tabs__tab");
    const cards = document.querySelectorAll(".company-card");

//    if (!tabsScroll || tabs.length === 0 || cards.length === 0)
//        return;
//
//    function setActive(tab) {
//        tabs.forEach(t => t.classList.remove("is-active"));
//        tab.classList.add("is-active");
//    }
//
//    function filter(cat) {
//        cards.forEach(card => {
//            const c = card.dataset.cat || "all";
//            card.style.display = (cat === "all" || c === cat) ? "" : "none";
//        });
//    }

    tabs.forEach(tab => {
        tab.addEventListener("click", () => {
            const category = tab.dataset.id || "all";

            // highlight tab
            tabs.forEach(t => t.classList.remove("is-active"));
            tab.classList.add("is-active");

            // chuyển trang
            window.location.href = "company?category=" + category + "&page=1";
        });
    });
});








/*--------------------------------------------- CV BAR -------------------------------------------*/
const cvTitleInput = document.getElementById("cvTitleInput");

cvTitleInput?.addEventListener("keydown", (e) => {
    if (e.key === "Enter")
        cvTitleInput.blur();
});

const LS_KEY = "mw_cv_title";

function loadTitle() {
    const saved = localStorage.getItem(LS_KEY);
    if (saved && cvTitleInput)
        cvTitleInput.value = saved;
}

function saveTitle() {
    if (!cvTitleInput)
        return;
    localStorage.setItem(LS_KEY, cvTitleInput.value.trim() || "CV chưa đặt tên");
}

cvTitleInput?.addEventListener("input", saveTitle);
loadTitle();

// buttons demo hooks
document.getElementById("cvPreviewBtn")?.addEventListener("click", () => {
    // hook preview modal/route
    console.log("Preview clicked");
});

document.getElementById("cvSaveBtn")?.addEventListener("click", () => {
    // hook save API
    console.log("Save clicked");
});






/*----------------------------------------------- VIET CV ---------------------------------------------*/

// ===== Focus glow (matchworks vibe) =====
document.querySelectorAll(".cv-builder input, .cv-builder textarea").forEach((el) => {
    el.addEventListener("focus", () => el.classList.add("is-focus"));
    el.addEventListener("blur", () => el.classList.remove("is-focus"));
});

// ===== Avatar upload + preview =====
const input = document.getElementById("avatarInput");
const preview = document.getElementById("avatarPreview");
const fallback = document.getElementById("avatarFallback");
const removeBtn = document.getElementById("avatarRemove");

// optional: block xám dưới avatar (nếu bạn có <div class="avatar-block">)
const avatarBlock = document.querySelector(".avatar-block");

// giới hạn dung lượng ảnh
const MAX_SIZE_MB = 3;
const MAX_BYTES = MAX_SIZE_MB * 1024 * 1024;

function setAvatar(src) {
    preview.src = src;
    preview.style.display = "block";
    fallback.style.display = "none";
    removeBtn.disabled = false;

    // nếu có block xám, đổi nó thành preview phụ cho “vibe template”
    if (avatarBlock) {
        avatarBlock.style.backgroundImage = `url('${src}')`;
        avatarBlock.style.backgroundSize = "cover";
        avatarBlock.style.backgroundPosition = "center";
    }
}

function clearAvatar() {
    preview.removeAttribute("src");
    preview.style.display = "none";
    fallback.style.display = "block";
    input.value = "";
    removeBtn.disabled = true;

    if (avatarBlock) {
        avatarBlock.style.backgroundImage = "";
        avatarBlock.style.backgroundColor = "#f3f6ff";
    }
}

function markError(el, on) {
    if (!el)
        return;
    el.classList.toggle("is-error", on);
    el.classList.toggle("is-error-dashed", on);
}

input?.addEventListener("change", () => {
    const file = input.files?.[0];
    if (!file)
        return;

    // validate type
    if (!file.type.startsWith("image/")) {
        alert("Vui lòng chọn file ảnh (png/jpg/webp...).");
        markError(document.querySelector(".avatar-uploader"), true);
        clearAvatar();
        return;
    }

    // validate size
    if (file.size > MAX_BYTES) {
        alert(`Ảnh quá nặng. Vui lòng chọn ảnh <= ${MAX_SIZE_MB}MB.`);
        markError(document.querySelector(".avatar-uploader"), true);
        clearAvatar();
        return;
    }

    markError(document.querySelector(".avatar-uploader"), false);

    const url = URL.createObjectURL(file);
    setAvatar(url);

    // free object url after load
    preview.onload = () => URL.revokeObjectURL(url);
});

removeBtn?.addEventListener("click", () => {
    markError(document.querySelector(".avatar-uploader"), false);
    clearAvatar();
});

// init
if (input && preview && fallback && removeBtn)
    clearAvatar();

// ===== (Optional) simple required validation demo =====
// Thêm data-required="true" vào input/textarea nào bạn muốn bắt buộc.
// Khi blur mà trống -> gạch đỏ chấm giống ảnh.
document.querySelectorAll(".cv-builder input[data-required='true'], .cv-builder textarea[data-required='true']")
        .forEach((el) => {
            const validate = () => {
                const empty = !String(el.value || "").trim();
                el.classList.toggle("is-error", empty);
                el.classList.toggle("is-error-dashed", empty);
            };
            el.addEventListener("blur", validate);
            el.addEventListener("input", validate);
        });