# Xiaoxiao Tu — personal homepage

An English academic homepage adapted from [Minimal Light](https://github.com/yaoyao-liu/minimal-light), built with Jekyll. The original CC0 license is preserved in `LICENSE`.

Configured destination: **https://tuxiaoxia0.github.io/**. This is a local preview; no push or deployment has been performed.

## Preview on this computer

From PowerShell in this repository:

```powershell
.\scripts\preview.ps1
```

Open **http://127.0.0.1:4000/**. Keep the terminal open; press Ctrl+C to stop. The script builds the site first, then serves that build. After editing, restart it to rebuild and refresh the browser. Use `-Port 4001` if port 4000 is occupied, or `-BuildOnly` to build without starting a server.

A portable Ruby 3.3 environment and Jekyll dependencies are installed under the ignored `tmp/` directory on this computer. They are local tools, excluded from both Git and the site output.

## Preview with a standard Ruby installation

Install Ruby and Bundler, then run:

```sh
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

For a production build, run `bundle exec jekyll build`. Jekyll writes to `_site/`. The Gemfile uses Jekyll 3.10; the local layout and Sass are self-contained. No remote theme, analytics, CDN scripts, or external font requests are required.

## Content and assets

| File | Purpose |
| --- | --- |
| `index.md` | About, selected publication, competitive programming awards, and teaching |
| `_data/publications.yml` | Selected publication title, authors, venue, and links |
| `_config.yml` | Name, public email, profile links, and GitHub Pages URL |
| `_layouts/homepage.html` | Page structure, navigation, and metadata |
| `_sass/minimal-light.scss` | Desktop, tablet, mobile, and print styles |
| `assets/img/xiaoxiao-tu.jpg` | Profile photo, cropped visually using CSS |
| `assets/files/xiaoxiao-tu-cv.pdf` | Public two-page CV without the telephone number |

The CV email `xiaoxiaotu@link.cuhk.edu.cn` is used throughout, per the owner's clarification. The original `Xiaoxiao_TU.pdf` and `photo.jpg` remain untouched locally and are explicitly ignored and excluded from the generated site. Only the public CV is linked. Its contact row retains the email and GitHub; all education, research, awards, and teaching content is preserved.

## Content provenance and optional additions

- Biographical content, awards, and teaching experience come from the supplied CV, with the owner's later corrections reflected in the homepage: third-year undergraduate; current LLM post-training research at CUHK-Shenzhen; summer 2026 research at NUS on agent evaluation. The downloadable CV remains as supplied apart from its public contact header.
- The numerical-approximations project is labeled **ICML 2026 AI4Math Workshop**, not the main conference. Its [ICML page](https://icml.cc/virtual/2026/82609) was checked for the title, author name, workshop status, and OpenReview destination.
- The supplied [PDF link](https://openreview.net/pdf?id=5dialBJcmD) is included. OpenReview currently presents an automated-browser verification screen, so direct PDF loading could not be verified in this environment.
- The owner-provided LinkedIn profile is linked alongside GitHub. Google Scholar and other social accounts were not supplied and are omitted.

## GitHub Pages configuration

`url` is `https://tuxiaoxia0.github.io` and `baseurl` is empty. Both template CNAME files, the original analytics identifier, sample publications, sample CV, duplicate static demo, and unused example assets have been removed. `LICENSE` is unchanged; the small template attribution remains.

Publish only after the owner has reviewed the preview. No deployment workflow or remote action is needed for local review.

## Preview verification

- Jekyll 3.10 production build completed successfully on Windows with Ruby 3.3.10.
- Browser layouts checked on desktop and mobile; no horizontal overflow or missing images. Section navigation lands on its targets correctly, and no browser warnings or errors were reported.
- The homepage, CSS, image, favicon, and CV return HTTP 200. All local links and anchors resolve, and the canonical URL points to the configured GitHub Pages site.
- Generated output contains exactly five public files; original source materials, local tools, documentation, and template demos are absent.
- The public CV was rendered and visually checked on both pages. Outside the contact row, the rendered pages match the original pixel for pixel; all body text is unchanged.
- The ICML and GitHub profile pages were verified in the browser. The OpenReview PDF remains subject to its browser verification screen.
