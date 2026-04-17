'use strict';

const initializeSiteNavigation = () => {
  const siteNav = document.querySelector('[data-site-nav]');

  if (!siteNav) {
    return;
  }

  const siteNavToggle = siteNav.querySelector('[data-site-nav-toggle]');
  const siteNavPanel = siteNav.querySelector('[data-site-nav-panel]');

  if (!siteNavToggle || !siteNavPanel || siteNavToggle.dataset.bound === 'true') {
    return;
  }

  const closeNavigation = () => {
    siteNav.classList.remove('is-open');
    siteNavToggle.setAttribute('aria-expanded', 'false');
  };

  const syncNavigationState = () => {
    if (window.innerWidth > 900) {
      closeNavigation();
    }
  };

  siteNavToggle.dataset.bound = 'true';

  siteNavToggle.addEventListener('click', () => {
    const isOpen = !siteNav.classList.contains('is-open');
    siteNav.classList.toggle('is-open', isOpen);
    siteNavToggle.setAttribute('aria-expanded', String(isOpen));
  });

  siteNavPanel.addEventListener('click', (event) => {
    if (window.innerWidth > 900) {
      return;
    }

    if (event.target.closest('a, button')) {
      closeNavigation();
    }
  });

  window.addEventListener('resize', syncNavigationState, { passive: true });
  syncNavigationState();
};

const initializeScrollUpArrow = () => {
  const scrollUpArrow = document.getElementById('scroll-up-arrow');

  if (!scrollUpArrow || scrollUpArrow.dataset.bound === 'true') {
    return;
  }

  const toggleVisibility = () => {
    scrollUpArrow.classList.toggle('is-visible', window.scrollY > 320);
  };

  scrollUpArrow.dataset.bound = 'true';
  scrollUpArrow.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

  window.addEventListener('scroll', toggleVisibility, { passive: true });
  toggleVisibility();
};

document.addEventListener('turbo:load', () => {
  initializeSiteNavigation();
  initializeScrollUpArrow();
});
