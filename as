<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IED Los Laureles · Descubriendo los Ecosistemas</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root{
    --forest:#123a23;
    --pine:#1c6b3c;
    --leaf:#2f8f57;
    --leaf-light:#bfe3c8;
    --sky:#48cae4;
    --sky-deep:#0096c7;
    --sand:#fbf6ea;
    --cream:#ffffff;
    --ink:#1b2e26;
    --ink-soft:#4a5d54;
    --sun:#f4c430;
    --coral:#c1272d;
    --school-green:#1c6b3c;
    --school-red:#c1272d;
    --school-yellow:#f4c430;
    --school-black:#1a1a1a;
    --radius:18px;
    --shadow:0 10px 30px rgba(27,67,50,0.12);
    --shadow-soft:0 4px 14px rgba(27,67,50,0.08);
  }
  *{box-sizing:border-box;}
  html{scroll-behavior:smooth;}
  body{
    margin:0;
    font-family:'Quicksand',sans-serif;
    color:var(--ink);
    background:var(--sand);
    line-height:1.6;
  }
  h1,h2,h3,h4{
    font-family:'Fredoka',sans-serif;
    color:var(--forest);
    margin:0 0 .5em;
  }
  a{color:inherit;}
  img{max-width:100%;display:block;}
  .container{max-width:1180px;margin:0 auto;padding:0 24px;}
  .eyebrow{
    display:inline-block;
    font-family:'Fredoka',sans-serif;
    font-size:.78rem;
    letter-spacing:.12em;
    text-transform:uppercase;
    font-weight:600;
    color:var(--school-green);
    background:var(--school-yellow);
    padding:6px 16px;
    border-radius:99px;
    margin-bottom:14px;
    border:1.5px solid var(--school-green);
  }
  /* ---------- NAV ---------- */
  header.topbar{
    position:sticky; top:0; z-index:200;
    background:rgba(255,255,255,0.92);
    backdrop-filter:blur(8px);
    border-bottom:1px solid rgba(27,67,50,0.08);
    box-shadow:0 3px 0 0 var(--school-green), 0 6px 0 0 var(--school-yellow), 0 9px 0 0 var(--school-red);
  }
  .nav-inner{
    max-width:1180px;margin:0 auto;padding:12px 24px;
    display:flex;align-items:center;justify-content:space-between;gap:16px;
  }
  .brand{display:flex;align-items:center;gap:12px;}
  .brand-badge{
    width:50px;height:50px;border-radius:50%;
    object-fit:cover; flex-shrink:0;
    box-shadow:var(--shadow-soft);
    border:2.5px solid var(--school-yellow);
    background:white;
  }
  .brand-text{font-family:'Fredoka',sans-serif;font-weight:600;color:var(--forest);font-size:.95rem;line-height:1.2;max-width:340px;}
  .brand-text small{display:block;font-family:'Quicksand';font-weight:500;color:var(--ink-soft);font-size:.72rem;}
  nav.links{display:flex;gap:4px;flex-wrap:wrap;}
  nav.links a{
    font-weight:600;font-size:.88rem;color:var(--pine);
    padding:9px 14px;border-radius:99px;text-decoration:none;
    transition:background .2s, color .2s;
    white-space:nowrap;
  }
  nav.links a:hover, nav.links a:focus-visible{background:var(--leaf-light);color:var(--forest);}
  #navToggle{display:none;}
  .burger{
    display:none;background:var(--leaf);border:none;border-radius:12px;
    width:44px;height:44px;cursor:pointer;
    flex-direction:column;align-items:center;justify-content:center;gap:5px;
  }
  .burger span{display:block;width:20px;height:2px;background:white;border-radius:2px;}

  /* ---------- HERO ---------- */
  .hero{
    position:relative;overflow:hidden;
    background:linear-gradient(180deg,#cdeef0 0%, #d8f0d0 55%, var(--sand) 100%);
    padding:64px 24px 90px;
  }
  .hero-inner{max-width:1180px;margin:0 auto;position:relative;z-index:5;text-align:center;}
  .hero h1{font-size:clamp(2rem,5vw,3.2rem);max-width:820px;margin:0 auto 16px;}
  .hero p.lead{max-width:680px;margin:0 auto 28px;color:var(--ink-soft);font-size:1.08rem;}
  .btn{
    display:inline-flex;align-items:center;gap:8px;
    font-family:'Fredoka',sans-serif;font-weight:600;font-size:.96rem;
    padding:14px 28px;border-radius:99px;border:none;cursor:pointer;
    text-decoration:none;transition:transform .18s, box-shadow .18s;
  }
  .btn-primary{background:var(--pine);color:white;box-shadow:0 8px 20px rgba(45,106,79,0.35);}
  .btn-primary:hover{transform:translateY(-2px);box-shadow:0 12px 26px rgba(45,106,79,0.4);}
  .btn-ghost{background:white;color:var(--school-red);border:2px solid var(--school-red);}
  .btn-ghost:hover{background:var(--school-red);color:white;}
  .hero-actions{display:flex;gap:14px;justify-content:center;flex-wrap:wrap;}

  .scene{
    position:absolute;inset:0;pointer-events:none;
  }
  .sun{
    position:absolute;top:30px;right:8%;width:70px;height:70px;border-radius:50%;
    background:radial-gradient(circle,var(--sun),#ffd166);
    box-shadow:0 0 40px 10px rgba(255,183,3,0.45);
    animation:pulse 4s ease-in-out infinite;
  }
  @keyframes pulse{0%,100%{transform:scale(1);}50%{transform:scale(1.08);}}
  .cloud{position:absolute;background:white;border-radius:99px;opacity:.85;}
  .cloud::before,.cloud::after{content:'';position:absolute;background:white;border-radius:50%;}
  .c1{width:90px;height:32px;top:60px;left:6%;animation:drift 30s linear infinite;}
  .c1::before{width:46px;height:46px;top:-22px;left:10px;}
  .c1::after{width:36px;height:36px;top:-14px;left:48px;}
  .c2{width:60px;height:24px;top:110px;left:30%;animation:drift 22s linear infinite reverse;}
  .c2::before{width:30px;height:30px;top:-14px;left:8px;}
  .c2::after{width:24px;height:24px;top:-10px;left:32px;}
  @keyframes drift{from{transform:translateX(-30px);}to{transform:translateX(40px);}}
  .hills{position:absolute;bottom:0;left:0;width:100%;height:140px;}
  .hill{position:absolute;bottom:-20px;border-radius:50% 50% 0 0;}
  .h1{width:60%;height:120px;left:-10%;background:var(--leaf);opacity:.55;}
  .h2{width:70%;height:90px;right:-10%;background:var(--pine);opacity:.5;}
  .h3{width:120%;height:70px;left:-10%;background:var(--forest);opacity:.35;}
  .tree{position:absolute;bottom:30px;animation:sway 5s ease-in-out infinite;transform-origin:bottom center;}
  .tree .trunk{display:block;width:8px;height:26px;background:#7a5230;margin:0 auto;border-radius:2px;}
  .tree .canopy{display:block;width:46px;height:46px;background:var(--leaf);border-radius:50% 50% 50% 0;margin:-34px auto 0;box-shadow:var(--shadow-soft);}
  @keyframes sway{0%,100%{transform:rotate(-3deg);}50%{transform:rotate(3deg);}}
  .t1{left:8%;animation-delay:.2s;}
  .t2{left:18%;transform:scale(.7);animation-delay:1s;}
  .t3{right:12%;transform:scale(1.1);animation-delay:.6s;}
  .t4{right:24%;transform:scale(.65);animation-delay:1.4s;}
  .critter{position:absolute;bottom:60px;left:40%;width:20px;height:16px;animation:flutter 6s ease-in-out infinite;}
  .butterfly .wing{position:absolute;top:0;width:10px;height:14px;background:var(--coral);border-radius:50% 50% 50% 0;}
  .butterfly .wing.left{left:0;transform:rotate(-15deg);}
  .butterfly .wing.right{right:0;transform:rotate(15deg) scaleX(-1);background:var(--sun);}
  @keyframes flutter{0%{transform:translate(0,0) rotate(0);}25%{transform:translate(20px,-30px) rotate(10deg);}50%{transform:translate(50px,-10px) rotate(-8deg);}75%{transform:translate(80px,-40px) rotate(6deg);}100%{transform:translate(0,0) rotate(0);}}

  /* ---------- SECTIONS GENERIC ---------- */
  section{padding:72px 24px;}
  section.alt{background:white;}
  .section-head{text-align:center;max-width:760px;margin:0 auto 44px;}
  .section-head h2{font-size:clamp(1.6rem,3.4vw,2.3rem);}
  .section-head p{color:var(--ink-soft);}

  .card-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:24px;}
  .card{
    background:white;border-radius:var(--radius);padding:28px;
    box-shadow:var(--shadow-soft); border:1px solid rgba(27,67,50,0.06);
    transition:transform .2s, box-shadow .2s;
  }
  .card:hover{transform:translateY(-4px);box-shadow:var(--shadow);}
  .card .icon{font-size:1.8rem;margin-bottom:10px;display:block;}

  /* mission/vision */
  .mv-grid{display:grid;grid-template-columns:1fr 1fr;gap:28px;}
  @media(max-width:760px){.mv-grid{grid-template-columns:1fr;}}
  .mv-card{
    border-radius:var(--radius);padding:32px;color:white;
    box-shadow:var(--shadow);
  }
  .mv-card.mission{background:linear-gradient(135deg,var(--pine),var(--forest));}
  .mv-card.vision{background:linear-gradient(135deg,var(--school-red),#8c1c22);}
  .mv-card h3{color:white;}
  .mv-card p{color:rgba(255,255,255,0.92);font-size:.96rem;}

  /* unit header */
  .unit-banner{
    background:linear-gradient(135deg,var(--leaf-light),var(--school-yellow));
    border-radius:24px;padding:40px;text-align:center;
    box-shadow:var(--shadow);
  }
  .unit-meta{display:flex;gap:14px;justify-content:center;flex-wrap:wrap;margin-top:18px;}
  .pill{font-weight:700;font-size:.85rem;padding:8px 18px;border-radius:99px;box-shadow:var(--shadow-soft);color:white;}
  .pill:nth-child(1){background:var(--school-green);}
  .pill:nth-child(2){background:var(--school-red);}
  .pill:nth-child(3){background:var(--school-black);}

  /* accordions */
  .accordion{max-width:880px;margin:0 auto;}
  .acc-item{
    background:white;border-radius:14px;margin-bottom:12px;overflow:hidden;
    box-shadow:var(--shadow-soft); border:1px solid rgba(27,67,50,0.07);
  }
  .acc-item summary{
    list-style:none;cursor:pointer;padding:18px 22px;
    font-family:'Fredoka',sans-serif;font-weight:600;color:var(--forest);
    display:flex;justify-content:space-between;align-items:center;gap:10px;
  }
  .acc-item summary::-webkit-details-marker{display:none;}
  .acc-item summary .arrow{transition:transform .25s;color:var(--leaf);font-size:1.1rem;}
  .acc-item[open] summary .arrow{transform:rotate(90deg);}
  .acc-body{padding:0 22px 20px;color:var(--ink-soft);}
  .acc-body ul{margin:6px 0;padding-left:20px;}
  .acc-body li{margin-bottom:4px;}

  /* tables */
  .table-wrap{overflow-x:auto;border-radius:16px;box-shadow:var(--shadow-soft);}
  table{border-collapse:collapse;width:100%;min-width:760px;background:white;}
  thead th{
    background:var(--pine);color:white;font-family:'Fredoka',sans-serif;
    font-weight:500;text-align:left;padding:12px 14px;font-size:.85rem;
  }
  tbody td{padding:12px 14px;font-size:.88rem;border-bottom:1px solid #eef3ee;color:var(--ink-soft);vertical-align:top;}
  tbody tr:nth-child(even){background:#f7fbf6;}
  tbody tr:hover{background:var(--leaf-light);}

  /* sessions tabs */
  .tabs{display:flex;gap:8px;flex-wrap:wrap;justify-content:center;margin-bottom:28px;}
  .tab-btn{
    font-family:'Fredoka',sans-serif;font-weight:600;font-size:.84rem;
    padding:10px 18px;border-radius:99px;border:2px solid var(--leaf-light);
    background:white;color:var(--pine);cursor:pointer;transition:all .2s;
  }
  .tab-btn.active, .tab-btn:hover{background:var(--school-red);color:white;border-color:var(--school-red);}
  .tab-panel{display:none;background:white;border-radius:18px;padding:28px;box-shadow:var(--shadow-soft);}
  .tab-panel.active{display:block;animation:fadeIn .35s ease;}
  @keyframes fadeIn{from{opacity:0;transform:translateY(6px);}to{opacity:1;transform:translateY(0);}}
  .session-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:18px;margin-top:14px;}
  .session-grid .mini{background:var(--sand);border-radius:12px;padding:14px 16px;}
  .session-grid .mini h5{margin:0 0 6px;font-family:'Fredoka';color:var(--pine);font-size:.86rem;}
  .session-grid .mini p{margin:0;font-size:.85rem;color:var(--ink-soft);}

  /* gallery */
  .gallery{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:16px;}
  .gallery .ph{
    border-radius:16px;aspect-ratio:4/3;display:flex;align-items:center;justify-content:center;
    font-size:2.6rem;color:white;box-shadow:var(--shadow-soft);
  }
  .ph1{background:linear-gradient(135deg,var(--leaf),var(--pine));}
  .ph2{background:linear-gradient(135deg,var(--school-red),#8c1c22);}
  .ph3{background:linear-gradient(135deg,var(--sun),#fb8500);}
  .ph4{background:linear-gradient(135deg,var(--school-yellow),#d9a400);}

  /* video (kept for optional future use) */
  .video-wrap{max-width:760px;margin:0 auto;border-radius:18px;overflow:hidden;box-shadow:var(--shadow);}
  .video-wrap iframe{width:100%;aspect-ratio:16/9;border:0;display:block;}

  /* memory game */
  .memory-board{
    display:grid;grid-template-columns:repeat(4,1fr);gap:14px;
    max-width:560px;margin:0 auto;perspective:1000px;
  }
  @media(max-width:480px){.memory-board{grid-template-columns:repeat(3,1fr);}}
  .memory-card{
    aspect-ratio:1/1;position:relative;cursor:pointer;
  }
  .memory-card-inner{
    width:100%;height:100%;position:relative;transform-style:preserve-3d;
    transition:transform .5s; border-radius:14px;
  }
  .memory-card.flipped .memory-card-inner, .memory-card.matched .memory-card-inner{transform:rotateY(180deg);}
  .memory-face{
    position:absolute;inset:0;backface-visibility:hidden;border-radius:14px;
    display:flex;align-items:center;justify-content:center;text-align:center;
    padding:6px;box-shadow:var(--shadow-soft);border:3px solid var(--school-black);
  }
  .memory-front{background:linear-gradient(135deg,var(--school-green) 50%, var(--school-red) 50%);}
  .memory-front::after{
    content:"";width:34%;height:34%;border-radius:50%;
    background:var(--school-yellow);border:3px solid var(--school-black);
  }
  .memory-back{background:var(--school-yellow);transform:rotateY(180deg);padding:10px;}
  .memory-back svg{width:62%;height:62%;}
  .memory-card.matched .memory-back{background:var(--school-green);border-color:var(--school-green);}
  .memory-card.matched .memory-back svg{stroke:white;}
  .memory-card.matched .memory-front{border-color:var(--school-green);}
  .memory-status{display:flex;justify-content:center;align-items:center;gap:20px;margin-top:24px;font-weight:600;color:var(--pine);flex-wrap:wrap;}

  /* quiz */
  .quiz-box{max-width:680px;margin:0 auto;background:white;border-radius:20px;padding:30px;box-shadow:var(--shadow);}
  .quiz-q{font-family:'Fredoka';font-weight:600;color:var(--forest);margin-bottom:16px;}
  .quiz-opts{display:flex;flex-direction:column;gap:10px;}
  .quiz-opt{
    text-align:left;padding:13px 18px;border-radius:12px;border:2px solid var(--leaf-light);
    background:var(--sand);cursor:pointer;font-family:'Quicksand';font-weight:600;color:var(--ink);
    transition:all .2s;
  }
  .quiz-opt:hover{background:var(--leaf-light);}
  .quiz-opt.correct{background:var(--leaf);color:white;border-color:var(--leaf);}
  .quiz-opt.wrong{background:var(--coral);color:white;border-color:var(--coral);}
  .quiz-feedback{margin-top:14px;font-weight:600;min-height:1.4em;}
  .quiz-nav{margin-top:18px;display:flex;justify-content:space-between;align-items:center;}
  .quiz-progress{font-size:.85rem;color:var(--ink-soft);}

  /* drag drop */
  .dragdrop{display:grid;grid-template-columns:1fr 1fr;gap:30px;max-width:780px;margin:0 auto;}
  @media(max-width:640px){.dragdrop{grid-template-columns:1fr;}}
  .drag-pool, .drop-zones{display:flex;flex-direction:column;gap:10px;}
  .drag-item{
    padding:12px 16px;border-radius:12px;background:var(--sun);color:#5a3c00;font-weight:700;
    cursor:grab;text-align:center;box-shadow:var(--shadow-soft);font-family:'Quicksand';
  }
  .drop-zone{
    min-height:54px;border:2px dashed var(--leaf);border-radius:12px;
    display:flex;align-items:center;justify-content:center;padding:8px;
    font-size:.85rem;color:var(--ink-soft);text-align:center;background:var(--sand);
  }
  .drop-zone.filled{border-style:solid;background:var(--leaf-light);color:var(--forest);font-weight:700;}

  /* accessibility note: criteria below are implemented structurally (contrast, focus states, alt text, captions-ready video wrap, responsive layout) without a dedicated visible section */

  /* footer */
  footer{
    background:linear-gradient(120deg, var(--school-green) 0%, var(--school-green) 48%, var(--school-red) 52%, var(--school-red) 100%);
    color:#fff;padding:54px 24px 28px;
    border-top:6px solid var(--school-yellow);
  }
  footer .container{display:flex;flex-wrap:wrap;justify-content:space-between;gap:32px;}
  footer h4{color:var(--school-yellow);font-size:1rem;letter-spacing:.02em;}
  footer p, footer a{color:rgba(255,255,255,0.92);font-size:.88rem;text-decoration:none;}
  footer a:hover{color:var(--school-yellow);}
  .footer-quote{
    text-align:center;font-family:'Fredoka';font-size:1.05rem;color:white;
    max-width:680px;margin:36px auto 0;padding-top:24px;border-top:1px solid rgba(255,255,255,0.25);
  }

  /* skip link & focus */
  .skip-link{
    position:absolute;left:-999px;top:0;background:var(--forest);color:white;
    padding:10px 16px;border-radius:0 0 10px 0;z-index:999;
  }
  .skip-link:focus{left:0;}
  a:focus-visible, button:focus-visible, summary:focus-visible{
    outline:3px solid var(--sky-deep);outline-offset:2px;
  }
  @media (prefers-reduced-motion: reduce){
    *{animation:none !important;transition:none !important;}
  }

  @media(max-width:880px){
    nav.links{position:fixed;top:70px;left:0;right:0;background:white;flex-direction:column;
      padding:14px 24px;box-shadow:0 12px 20px rgba(0,0,0,0.08);
      transform:translateY(-130%);opacity:0;transition:all .25s; max-height:70vh;overflow-y:auto;}
    #navToggle:checked ~ nav.links{transform:translateY(0);opacity:1;}
    .burger{display:flex;}
  }
</style>
</head>
<body>

<a class="skip-link" href="#contenido">Saltar al contenido principal</a>

<header class="topbar">
  <div class="nav-inner">
    <a class="brand" href="#inicio" style="text-decoration:none;">
      <img class="brand-badge" src="data:image/jpeg;base64,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" alt="Escudo de la Institución Educativa Distrital Los Laureles">
      <span class="brand-text">Institución Educativa Distrital Los Laureles<small>Ciencias Naturales · Quinto grado</small></span>
    </a>
    <input type="checkbox" id="navToggle" style="display:none;">
    <label class="burger" for="navToggle" aria-label="Abrir menú"><span></span><span></span><span></span></label>
    <nav class="links" aria-label="Navegación principal">
      <a href="#institucion">Institución</a>
      <a href="#unidad">Unidad didáctica</a>
      <a href="#malla">Malla curricular</a>
      <a href="#secuencia">Secuencia</a>
      <a href="#recursos">Recursos</a>
      <a href="#actividades">Actividades</a>
      <a href="#evaluacion">Evaluación</a>
      <a href="#contacto">Contacto</a>
    </nav>
  </div>
</header>

<!-- HERO -->
<section class="hero" id="inicio">
  <div class="scene" aria-hidden="true">
    <div class="sun"></div>
    <div class="cloud c1"></div>
    <div class="cloud c2"></div>
    <div class="hills">
      <div class="hill h3"></div>
      <div class="hill h2"></div>
      <div class="hill h1"></div>
    </div>
    <div class="tree t1" aria-hidden="true"><span class="trunk"></span><span class="canopy"></span></div>
    <div class="tree t2" aria-hidden="true"><span class="trunk"></span><span class="canopy"></span></div>
    <div class="tree t3" aria-hidden="true"><span class="trunk"></span><span class="canopy"></span></div>
    <div class="tree t4" aria-hidden="true"><span class="trunk"></span><span class="canopy"></span></div>
    <div class="critter butterfly" aria-hidden="true"><span class="wing left"></span><span class="wing right"></span></div>
  </div>
  <div class="hero-inner">
    <span class="eyebrow">Plataforma educativa institucional</span>
    <h1>Bienvenidos a la plataforma educativa de la Institución Educativa Distrital Los Laureles</h1>
    <p class="lead">Este espacio presenta una unidad didáctica inclusiva del área de Ciencias Naturales, creada desde un enfoque pedagógico crítico-social y fundamentada en los principios de la educación inclusiva, para que todos los estudiantes aprendan, participen y cuiden su entorno.</p>
    <div class="hero-actions">
      <a class="btn btn-primary" href="#unidad">Conocer la unidad didáctica</a>
      <a class="btn btn-ghost" href="#actividades">Ir a las actividades</a>
    </div>
  </div>
</section>

<main id="contenido">

<!-- INSTITUCIÓN -->
<section id="institucion">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Nuestra institución</span>
      <h2>Misión y visión</h2>
      <p>Una comunidad educativa comprometida con la formación integral, inclusiva y con equidad social.</p>
    </div>
    <div class="mv-grid">
      <div class="mv-card mission">
        <h3>Misión</h3>
        <p>La Institución Educativa Distrital Los Laureles es un centro formativo de carácter oficial que ofrece educación en los niveles de preescolar, básica y media. Su propósito fundamental es brindar una formación integral, inclusiva y con equidad social, desarrollando en niños, niñas y jóvenes competencias académicas, ciudadanas y técnicas. El colegio enfoca sus esfuerzos en promover la convivencia pacífica, los valores éticos y el desarrollo comunitario para capacitar a los estudiantes como agentes activos en la transformación de su entorno socioeconómico.</p>
      </div>
      <div class="mv-card vision">
        <h3>Visión</h3>
        <p>Para los próximos años, la Institución Educativa Distrital Los Laureles se proyecta como una entidad líder y de referencia en el ámbito educativo distrital. Su meta es consolidarse como un espacio de alta calidad pedagógica y tecnológica, reconocido por graduar bachilleres con un sólido perfil ético, crítico y emprendedor, afianzando alianzas de articulación técnica para el acceso exitoso a la educación superior y al mundo laboral.</p>
      </div>
    </div>
  </div>
</section>

<!-- UNIDAD DIDÁCTICA -->
<section class="alt" id="unidad">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Unidad didáctica inclusiva</span>
      <h2>Descubriendo los Ecosistemas</h2>
      <p>Una experiencia inclusiva para comprender y cuidar nuestro entorno.</p>
    </div>
    <div class="unit-banner">
      <h3 style="margin-bottom:6px;">Descubriendo los Ecosistemas</h3>
      <p style="color:var(--forest);max-width:640px;margin:0 auto;">Diseñada para todo el grupo, con ajustes razonables para estudiantes con Trastorno del Espectro Autista (TEA), garantizando la participación de todos mediante estrategias inclusivas.</p>
      <div class="unit-meta">
        <span class="pill">Área: Ciencias Naturales</span>
        <span class="pill">Grado: Quinto de primaria</span>
        <span class="pill">Duración: 4 semanas · 8 sesiones</span>
      </div>
    </div>

    <div style="height:40px;"></div>

    <div class="accordion">
      <details class="acc-item" open>
        <summary>Modelo pedagógico <span class="arrow">›</span></summary>
        <div class="acc-body"><p>La unidad se fundamenta en el <strong>modelo pedagógico crítico-social</strong>, propio de la institución. Busca formar estudiantes críticos, reflexivos y participativos, capaces de analizar su realidad y contribuir a la transformación de su entorno mediante el diálogo, la investigación, la resolución de problemas y el aprendizaje colaborativo.</p></div>
      </details>
      <details class="acc-item">
        <summary>Justificación <span class="arrow">›</span></summary>
        <div class="acc-body"><p>Diseñada desde los principios de la educación inclusiva y el Diseño Universal para el Aprendizaje (DUA), garantiza múltiples formas de representación, acción, expresión y participación para todos los estudiantes, incluyendo aquellos con Trastorno del Espectro Autista (TEA). El estudio de los ecosistemas fortalece el pensamiento científico, la conciencia ambiental y el aprendizaje significativo.</p></div>
      </details>
      <details class="acc-item">
        <summary>Objetivo general <span class="arrow">›</span></summary>
        <div class="acc-body"><p>Comprender la estructura y el funcionamiento de los ecosistemas, reconociendo la importancia de su conservación mediante actividades inclusivas que promuevan el aprendizaje significativo, el pensamiento crítico y el trabajo colaborativo.</p></div>
      </details>
      <details class="acc-item">
        <summary>Objetivos específicos <span class="arrow">›</span></summary>
        <div class="acc-body">
          <ul>
            <li>Identificar los componentes bióticos y abióticos presentes en los diferentes ecosistemas mediante actividades visuales e interactivas.</li>
            <li>Reconocer las relaciones entre los seres vivos y su entorno, comprendiendo la importancia de los ecosistemas para el equilibrio ambiental.</li>
            <li>Promover actitudes de respeto y conservación del medio ambiente mediante estrategias inclusivas que favorezcan la participación de todos los estudiantes, incluyendo aquellos con TEA.</li>
          </ul>
        </div>
      </details>
      <details class="acc-item">
        <summary>Objetivos de aprendizaje <span class="arrow">›</span></summary>
        <div class="acc-body">
          <ul>
            <li>Define qué es un ecosistema y distingue sus componentes bióticos y abióticos.</li>
            <li>Clasifica distintos tipos de ecosistemas según sus características.</li>
            <li>Explica las relaciones de alimentación entre los seres vivos a través de cadenas alimenticias.</li>
            <li>Propone acciones concretas de cuidado y conservación de su entorno.</li>
          </ul>
        </div>
      </details>
      <details class="acc-item">
        <summary>Estándar básico de competencia <span class="arrow">›</span></summary>
        <div class="acc-body"><p>Identifico estructuras de los seres vivos que les permiten desarrollarse en un entorno y relacionar esta característica con su capacidad de transformar y adaptarse al medio, comprendiendo las relaciones entre los componentes bióticos y abióticos del ecosistema y la importancia de su conservación.</p></div>
      </details>
      <details class="acc-item">
        <summary>Derechos Básicos de Aprendizaje (DBA) <span class="arrow">›</span></summary>
        <div class="acc-body">
          <ul>
            <li>Comprende que los ecosistemas están conformados por organismos y un entorno físico, así como las relaciones que se dan entre ellos.</li>
            <li>Explica la dinámica de un ecosistema teniendo en cuenta los cambios de los factores bióticos y abióticos a través del tiempo.</li>
            <li>Identifica el rol de los organismos productores, consumidores y descomponedores dentro de una cadena alimenticia.</li>
          </ul>
        </div>
      </details>
      <details class="acc-item">
        <summary>Competencias (saber / saber hacer / saber ser) <span class="arrow">›</span></summary>
        <div class="acc-body">
          <ul>
            <li><strong>Saber:</strong> comprende el concepto de ecosistema, reconoce sus componentes y explica las relaciones entre los seres vivos y el ambiente.</li>
            <li><strong>Saber hacer:</strong> clasifica organismos, interpreta imágenes, analiza situaciones ambientales, participa en actividades experimentales sencillas y resuelve ejercicios relacionados con los ecosistemas.</li>
            <li><strong>Saber ser:</strong> demuestra respeto por la naturaleza, trabaja colaborativamente, valora la diversidad y participa activamente en actividades de cuidado ambiental.</li>
          </ul>
        </div>
      </details>
      <details class="acc-item">
        <summary>Contenidos <span class="arrow">›</span></summary>
        <div class="acc-body">
          <p><strong>Conceptuales:</strong> ecosistema, componentes bióticos, componentes abióticos, tipos de ecosistemas, cadenas alimenticias, conservación del medio ambiente.</p>
          <p><strong>Procedimentales:</strong> observación, clasificación, comparación, interpretación de imágenes, resolución de actividades prácticas.</p>
          <p><strong>Actitudinales:</strong> respeto por la biodiversidad, trabajo colaborativo, responsabilidad ambiental, participación activa, valoración de la diversidad.</p>
        </div>
      </details>
    </div>
  </div>
</section>

<!-- MALLA CURRICULAR -->
<section id="malla">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Planeación</span>
      <h2>Malla curricular de la unidad</h2>
      <p>Organización general de las cinco sesiones que componen la unidad didáctica.</p>
    </div>
    <div class="table-wrap">
      <table>
        <thead>
          <tr><th>Sesión</th><th>Tema</th><th>Objetivo de aprendizaje</th><th>Estrategias de inclusión</th><th>Recursos</th><th>Forma de trabajo</th><th>Evidencias</th><th>Instrumento</th></tr>
        </thead>
        <tbody>
          <tr><td>1</td><td>¿Qué es un ecosistema?</td><td>Reconocer el concepto de ecosistema y sus elementos.</td><td>Pictogramas, agenda visual, instrucciones cortas.</td><td>Video, imágenes, tablero.</td><td>Plenaria / parejas</td><td>Dibujo del ecosistema.</td><td>Lista de chequeo</td></tr>
          <tr><td>2</td><td>Componentes bióticos y abióticos</td><td>Diferenciar elementos vivos y no vivos del entorno.</td><td>Material manipulativo, tarjetas ilustradas.</td><td>Tarjetas, cartulinas.</td><td>Grupos cooperativos</td><td>Clasificación de tarjetas.</td><td>Rúbrica</td></tr>
          <tr><td>3</td><td>Tipos de ecosistemas</td><td>Clasificar ecosistemas según sus características.</td><td>Apoyos visuales, videos breves.</td><td>Video beam, presentación digital.</td><td>Individual / grupal</td><td>Cuadro comparativo.</td><td>Lista de chequeo</td></tr>
          <tr><td>4</td><td>Cadenas alimenticias</td><td>Explicar relaciones de alimentación entre seres vivos.</td><td>Rutinas estructuradas, refuerzo positivo.</td><td>Tarjetas ilustradas, guías impresas.</td><td>Parejas</td><td>Cadena alimenticia armada.</td><td>Rúbrica</td></tr>
          <tr><td>5</td><td>Proyecto final: "Cuidemos nuestro planeta"</td><td>Proponer acciones de conservación ambiental.</td><td>Tiempos flexibles, trabajo cooperativo.</td><td>Material reciclable, recursos digitales.</td><td>Grupos cooperativos</td><td>Proyecto y presentación.</td><td>Rúbrica + autoevaluación</td></tr>
        </tbody>
      </table>
    </div>
  </div>
</section>

<!-- SECUENCIA DIDÁCTICA -->
<section class="alt" id="secuencia">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Paso a paso</span>
      <h2>Secuencia didáctica</h2>
      <p>Explora cada sesión: inicio, desarrollo, cierre y ajustes inclusivos.</p>
    </div>
    <div class="tabs" role="tablist">
      <button class="tab-btn active" data-tab="s1">Sesión 1</button>
      <button class="tab-btn" data-tab="s2">Sesión 2</button>
      <button class="tab-btn" data-tab="s3">Sesión 3</button>
      <button class="tab-btn" data-tab="s4">Sesión 4</button>
      <button class="tab-btn" data-tab="s5">Sesión 5</button>
    </div>

    <div class="tab-panel active" id="s1">
      <h3>¿Qué es un ecosistema?</h3>
      <p style="color:var(--ink-soft);">Tiempo estimado: 90 minutos · Trabajo en plenaria y parejas.</p>
      <div class="session-grid">
        <div class="mini"><h5>Inicio</h5><p>Conversatorio sobre lugares naturales conocidos por los estudiantes, apoyado con imágenes.</p></div>
        <div class="mini"><h5>Desarrollo</h5><p>Video corto sobre ecosistemas y construcción colectiva del concepto con pictogramas.</p></div>
        <div class="mini"><h5>Cierre</h5><p>Cada estudiante dibuja un ecosistema que conozca y lo comparte con su pareja.</p></div>
        <div class="mini"><h5>Estrategias DUA / TEA</h5><p>Agenda visual de la sesión, instrucciones cortas y ambiente con pocos distractores.</p></div>
        <div class="mini"><h5>Evaluación</h5><p>Lista de chequeo sobre identificación del concepto de ecosistema.</p></div>
      </div>
    </div>

    <div class="tab-panel" id="s2">
      <h3>Componentes bióticos y abióticos</h3>
      <p style="color:var(--ink-soft);">Tiempo estimado: 90 minutos · Grupos cooperativos.</p>
      <div class="session-grid">
        <div class="mini"><h5>Inicio</h5><p>Juego de identificación: "vivo o no vivo" con tarjetas ilustradas.</p></div>
        <div class="mini"><h5>Desarrollo</h5><p>Clasificación grupal de elementos bióticos y abióticos en cartulinas.</p></div>
        <div class="mini"><h5>Cierre</h5><p>Socialización de las clasificaciones realizadas por cada grupo.</p></div>
        <div class="mini"><h5>Estrategias DUA / TEA</h5><p>Material manipulativo y refuerzo positivo constante.</p></div>
        <div class="mini"><h5>Evaluación</h5><p>Rúbrica de participación y clasificación correcta.</p></div>
      </div>
    </div>

    <div class="tab-panel" id="s3">
      <h3>Tipos de ecosistemas</h3>
      <p style="color:var(--ink-soft);">Tiempo estimado: 90 minutos · Trabajo individual y grupal.</p>
      <div class="session-grid">
        <div class="mini"><h5>Inicio</h5><p>Presentación digital con imágenes de distintos ecosistemas (terrestres y acuáticos).</p></div>
        <div class="mini"><h5>Desarrollo</h5><p>Elaboración de un cuadro comparativo entre ecosistemas, con apoyo visual.</p></div>
        <div class="mini"><h5>Cierre</h5><p>Juego de adivinanzas sobre los ecosistemas trabajados.</p></div>
        <div class="mini"><h5>Estrategias DUA / TEA</h5><p>Videos breves y apoyos visuales para reforzar conceptos.</p></div>
        <div class="mini"><h5>Evaluación</h5><p>Lista de chequeo del cuadro comparativo.</p></div>
      </div>
    </div>

    <div class="tab-panel" id="s4">
      <h3>Cadenas alimenticias</h3>
      <p style="color:var(--ink-soft);">Tiempo estimado: 90 minutos · Trabajo en parejas.</p>
      <div class="session-grid">
        <div class="mini"><h5>Inicio</h5><p>Explicación con tarjetas ilustradas de productores, consumidores y descomponedores.</p></div>
        <div class="mini"><h5>Desarrollo</h5><p>Armado en parejas de cadenas alimenticias con tarjetas.</p></div>
        <div class="mini"><h5>Cierre</h5><p>Presentación de las cadenas alimenticias construidas.</p></div>
        <div class="mini"><h5>Estrategias DUA / TEA</h5><p>Rutinas estructuradas y tiempos flexibles de trabajo.</p></div>
        <div class="mini"><h5>Evaluación</h5><p>Rúbrica de la cadena alimenticia armada.</p></div>
      </div>
    </div>

    <div class="tab-panel" id="s5">
      <h3>Proyecto final: "Cuidemos nuestro planeta"</h3>
      <p style="color:var(--ink-soft);">Tiempo estimado: 90 minutos · Grupos cooperativos.</p>
      <div class="session-grid">
        <div class="mini"><h5>Inicio</h5><p>Recapitulación de lo aprendido mediante un mapa conceptual colectivo.</p></div>
        <div class="mini"><h5>Desarrollo</h5><p>Elaboración de un proyecto grupal con material reciclable que proponga acciones de cuidado ambiental.</p></div>
        <div class="mini"><h5>Cierre</h5><p>Presentación de los proyectos a la comunidad educativa.</p></div>
        <div class="mini"><h5>Estrategias DUA / TEA</h5><p>Trabajo cooperativo con roles claros y tiempos flexibles.</p></div>
        <div class="mini"><h5>Evaluación</h5><p>Rúbrica de proyecto final y autoevaluación.</p></div>
      </div>
    </div>
  </div>
</section>

<!-- FORMA DE TRABAJO Y ESTRATEGIAS DE INCLUSIÓN -->
<section id="metodologia">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Cómo trabajamos</span>
      <h2>Forma de trabajo y estrategias de inclusión</h2>
    </div>
    <div class="card-grid">
      <div class="card">
        <span class="icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" width="32" height="32"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></span>
        <h3>Forma de trabajo</h3>
        <p>Trabajo individual, colaborativo y cooperativo; conversatorios; aprendizaje basado en proyectos; actividades manipulativas; uso de TIC; juegos educativos y aprendizaje por descubrimiento.</p>
      </div>
      <div class="card">
        <span class="icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" width="32" height="32"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg></span>
        <h3>Estrategias de inclusión (DUA / TEA)</h3>
        <p>Pictogramas, agendas visuales, apoyos visuales, instrucciones cortas, videos breves, material manipulativo, rutinas estructuradas, tiempos flexibles, refuerzo positivo y ambientes con pocos distractores.</p>
      </div>
    </div>
  </div>
</section>

<!-- RECURSOS -->
<section class="alt" id="recursos">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Apoyos</span>
      <h2>Recursos de la unidad</h2>
    </div>
    <div class="card-grid">
      <div class="card">
        <span class="icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" width="32" height="32"><circle cx="12" cy="7" r="4"/><path d="M5.5 21a6.5 6.5 0 0 1 13 0"/></svg></span>
        <h3>Recursos humanos</h3>
        <p>Docente, estudiantes y familias, vinculadas cuando sea necesario para reforzar el aprendizaje en casa.</p>
      </div>
      <div class="card">
        <span class="icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" width="32" height="32"><rect x="2" y="4" width="20" height="13" rx="2"/><path d="M8 21h8M12 17v4"/></svg></span>
        <h3>Recursos tecnológicos</h3>
        <p>Computador, video beam, tabletas, internet, plataforma web, videos educativos, presentaciones digitales y juegos interactivos.</p>
      </div>
      <div class="card">
        <span class="icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" width="32" height="32"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/></svg></span>
        <h3>Recursos didácticos</h3>
        <p>Imágenes, pictogramas, tarjetas ilustradas, cartulinas, marcadores, material reciclable, guías impresas y recursos digitales accesibles.</p>
      </div>
    </div>

    <div style="height:50px;"></div>

    <div class="section-head">
      <span class="eyebrow">Galería</span>
      <h2>Nuestros ecosistemas</h2>
    </div>
    <div class="gallery">
      <div class="ph ph1" role="img" aria-label="Ilustración de bosque con árboles y vegetación"><svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" width="48" height="48"><path d="M12 2 7 10h3l-4 6h4l-3 6h10l-3-6h4l-4-6h3z"/></svg></div>
      <div class="ph ph2" role="img" aria-label="Ilustración de ecosistema acuático con peces"><svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" width="48" height="48"><path d="M6.5 12c2-3 4.5-4 7-4s5 1.5 6.5 4c-1.5 2.5-4 4-6.5 4s-5-1-7-4Z"/><circle cx="15" cy="12" r="0.6" fill="white"/><path d="M6.5 12 2 9m4.5 3L2 15"/></svg></div>
      <div class="ph ph3" role="img" aria-label="Ilustración de sabana con sol y animales"><svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" width="48" height="48"><circle cx="12" cy="8" r="3.2"/><path d="M12 1.5v1.5M12 13v1.5M5.5 8H7M17 8h1.5M7 3.5 8 4.6M16 3.5 15 4.6"/><path d="M3 20c2-3 5-4 9-4s7 1 9 4"/></svg></div>
      <div class="ph ph4" role="img" aria-label="Ilustración de mariposa y flores"><svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" width="48" height="48"><path d="M12 4v16"/><path d="M12 8c-2-3-7-3-8 0s2 5 8 4c6 1 9-1 8-4s-6-3-8 0Z"/></svg></div>
    </div>
  </div>
</section>

<!-- ACTIVIDADES -->
<section id="actividades">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Aprende jugando</span>
      <h2>Actividades interactivas</h2>
      <p>Pon a prueba lo aprendido sobre los ecosistemas.</p>
    </div>

    <div class="section-head">
      <span class="eyebrow">Juego de memoria</span>
      <h2>Encuentra las parejas</h2>
      <p>Voltea las tarjetas y encuentra las parejas de imágenes relacionadas con los ecosistemas.</p>
    </div>
    <div class="memory-board" id="memoryBoard"></div>
    <div class="memory-status">
      <span id="memoryMoves">Intentos: 0</span>
      <button class="btn btn-ghost" id="memoryRestart">Reiniciar juego</button>
    </div>

    <div style="height:50px;"></div>

    <div class="quiz-box" id="quizBox">
      <p class="quiz-progress" id="quizProgress">Pregunta 1 de 3</p>
      <p class="quiz-q" id="quizQuestion"></p>
      <div class="quiz-opts" id="quizOpts"></div>
      <p class="quiz-feedback" id="quizFeedback"></p>
      <div class="quiz-nav">
        <button class="btn btn-ghost" id="quizRestart">Reiniciar</button>
        <span id="quizScore" style="font-weight:700;color:var(--pine);"></span>
      </div>
    </div>

    <div style="height:50px;"></div>

    <div class="section-head">
      <span class="eyebrow">Arrastra y suelta</span>
      <h2>¿Vivo o no vivo?</h2>
      <p>Arrastra cada elemento hacia la categoría correcta.</p>
    </div>
    <div class="dragdrop">
      <div>
        <h4 style="text-align:center;">Elementos</h4>
        <div class="drag-pool" id="dragPool">
          <div class="drag-item" draggable="true" data-cat="biotico">Árbol</div>
          <div class="drag-item" draggable="true" data-cat="abiotico">Sol</div>
          <div class="drag-item" draggable="true" data-cat="biotico">Ave</div>
          <div class="drag-item" draggable="true" data-cat="abiotico">Agua</div>
        </div>
      </div>
      <div>
        <h4 style="text-align:center;">Categorías</h4>
        <div class="drop-zones">
          <div class="drop-zone" data-cat="biotico">Suelta aquí: Componente biótico (ser vivo)</div>
          <div class="drop-zone" data-cat="abiotico">Suelta aquí: Componente abiótico (sin vida)</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- EVALUACIÓN -->
<section class="alt" id="evaluacion">
  <div class="container">
    <div class="section-head">
      <span class="eyebrow">Seguimiento al aprendizaje</span>
      <h2>Evaluación</h2>
      <p>Un proceso continuo, diagnóstico, formativo y sumativo.</p>
    </div>
    <div class="table-wrap">
      <table>
        <thead><tr><th>Tipo de evaluación</th><th>Qué se evalúa</th><th>Evidencias</th><th>Instrumento</th></tr></thead>
        <tbody>
          <tr><td>Diagnóstica</td><td>Conocimientos previos sobre ecosistemas.</td><td>Conversatorio inicial, dibujo libre.</td><td>Observación directa</td></tr>
          <tr><td>Formativa</td><td>Participación, trabajo colaborativo, resolución de actividades, comprensión de conceptos y desarrollo de habilidades científicas.</td><td>Actividades de cada sesión.</td><td>Listas de chequeo</td></tr>
          <tr><td>Sumativa</td><td>Proyecto final, presentación, mapa conceptual, actividades desarrolladas y actitudes de respeto por el ambiente.</td><td>Proyecto "Cuidemos nuestro planeta".</td><td>Rúbrica, autoevaluación y coevaluación</td></tr>
        </tbody>
      </table>
    </div>
  </div>
</section>

</main>

<footer id="contacto">
  <div class="container">
    <div>
      <h4>Institución Educativa Distrital Los Laureles</h4>
      <p>Educación oficial en preescolar, básica y media.</p>
    </div>
    <div>
      <h4>Contacto</h4>
      <p>Sede principal — IED Los Laureles</p>
      <p><a href="https://www.google.com/search?q=ied+los+laureles+direcci%C3%B3n&ludocid=6524234197548468627" target="_blank" rel="noopener">Dirección</a>: Cl. 37C #1H - 10, Cisneros, Barranquilla, Atlántico</p>
      <p>Teléfono: (605) 363 1264</p>
      <p>contacto@iedloslaureles.edu.co</p>
    </div>
    <div>
      <h4>Unidad didáctica</h4>
      <p>Ciencias Naturales · Quinto grado</p>
      <p>Descubriendo los Ecosistemas</p>
    </div>
  </div>
  <p class="footer-quote">"Educación inclusiva para comprender, cuidar y transformar nuestro entorno. Todos aprendemos cuando todos participamos."</p>
</footer>

<script>
  // Tabs
  document.querySelectorAll('.tab-btn').forEach(btn=>{
    btn.addEventListener('click',()=>{
      document.querySelectorAll('.tab-btn').forEach(b=>b.classList.remove('active'));
      document.querySelectorAll('.tab-panel').forEach(p=>p.classList.remove('active'));
      btn.classList.add('active');
      document.getElementById(btn.dataset.tab).classList.add('active');
    });
  });

  // Quiz
  const quizData = [
    {q:"¿Qué es un ecosistema?", opts:["Un conjunto de seres vivos y su entorno, relacionados entre sí","Solo un grupo de animales","Un tipo de planta","Un objeto sin vida"], correct:0},
    {q:"¿Cuál de estos es un componente abiótico?", opts:["Un árbol","El agua","Un pájaro","Una mariposa"], correct:1},
    {q:"¿Cuál de las siguientes es una acción para cuidar los ecosistemas?", opts:["Botar basura en los ríos","Reciclar y reutilizar materiales","Talar árboles sin control","Dejar grifos abiertos"], correct:1},
    {q:"En una cadena alimenticia, ¿quién produce su propio alimento?", opts:["El consumidor","El descomponedor","El productor (planta)","El depredador"], correct:2}
  ];
  let qIndex=0, score=0;
  const qQuestion=document.getElementById('quizQuestion');
  const qOpts=document.getElementById('quizOpts');
  const qFeedback=document.getElementById('quizFeedback');
  const qProgress=document.getElementById('quizProgress');
  const qScore=document.getElementById('quizScore');

  function loadQuiz(){
    qFeedback.textContent='';
    const item=quizData[qIndex];
    qProgress.textContent=`Pregunta ${qIndex+1} de ${quizData.length}`;
    qQuestion.textContent=item.q;
    qOpts.innerHTML='';
    item.opts.forEach((opt,i)=>{
      const b=document.createElement('button');
      b.className='quiz-opt';
      b.textContent=opt;
      b.addEventListener('click',()=>checkAnswer(i,b));
      qOpts.appendChild(b);
    });
    qScore.textContent='';
  }
  function checkAnswer(i,btn){
    const item=quizData[qIndex];
    const allBtns=qOpts.querySelectorAll('.quiz-opt');
    allBtns.forEach(b=>b.disabled=true);
    if(i===item.correct){
      btn.classList.add('correct');
      qFeedback.textContent='¡Correcto!';
      qFeedback.style.color='var(--pine)';
      score++;
    }else{
      btn.classList.add('wrong');
      allBtns[item.correct].classList.add('correct');
      qFeedback.textContent='Casi... ¡sigue intentando!';
      qFeedback.style.color='var(--coral)';
    }
    setTimeout(()=>{
      qIndex++;
      if(qIndex<quizData.length){ loadQuiz(); }
      else{
        qQuestion.textContent='¡Completaste el cuestionario!';
        qOpts.innerHTML='';
        qFeedback.textContent='';
        qScore.textContent=`Puntaje: ${score} de ${quizData.length}`;
        qProgress.textContent='Cuestionario finalizado';
      }
    },1200);
  }
  document.getElementById('quizRestart').addEventListener('click',()=>{ qIndex=0; score=0; loadQuiz(); });
  loadQuiz();

  // Drag and drop
  document.querySelectorAll('.drag-item').forEach(item=>{
    item.addEventListener('dragstart',e=>{
      e.dataTransfer.setData('text/plain', JSON.stringify({cat:item.dataset.cat, text:item.textContent}));
    });
  });
  document.querySelectorAll('.drop-zone').forEach(zone=>{
    zone.addEventListener('dragover',e=>e.preventDefault());
    zone.addEventListener('drop',e=>{
      e.preventDefault();
      const data=JSON.parse(e.dataTransfer.getData('text/plain'));
      if(data.cat===zone.dataset.cat){
        zone.textContent=data.text+' ✓';
        zone.classList.add('filled');
      }else{
        const original=zone.textContent;
        zone.textContent='Intenta de nuevo';
        setTimeout(()=>{ zone.textContent=original; },900);
      }
    });
  });

  // Memory game
  const memoryIcons = {
    Sol: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="4.2"/><path d="M12 2.5v2.4M12 19v2.4M4.6 4.6l1.7 1.7M17.7 17.7l1.7 1.7M2.5 12h2.4M19 12h2.4M4.6 19.4l1.7-1.7M17.7 6.3l1.7-1.7"/></svg>',
    Arbol: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2 7 10h3l-4 6h4l-3 6h10l-3-6h4l-4-6h3z"/></svg>',
    Pez: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M6.5 12c2-3 4.5-4 7-4s5 1.5 6.5 4c-1.5 2.5-4 4-6.5 4s-5-1-7-4Z"/><circle cx="15" cy="12" r="0.6" fill="var(--school-black)"/><path d="M6.5 12 2 9m4.5 3L2 15"/></svg>',
    Hongo: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M4 11a8 8 0 0 1 16 0Z"/><path d="M9 11v8a3 3 0 0 0 6 0v-8"/></svg>',
    Conejo: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M8 9c-1-3-1-6 1-6s1.5 3 1.5 5M16 9c1-3 1-6-1-6s-1.5 3-1.5 5"/><ellipse cx="12" cy="14" rx="6" ry="5.5"/><circle cx="10" cy="13" r="0.6" fill="var(--school-black)"/><circle cx="14" cy="13" r="0.6" fill="var(--school-black)"/></svg>',
    Hoja: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M5 13c0-6 5-10 14-10 0 9-4 14-10 14-2 0-4-1-4-4Z"/><path d="M5 19c3-3 6-6 14-14"/></svg>',
    Roca: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M3 16c0-2 1.5-3 3-4.5C7.5 9 9 7 12 7s4 2 5.5 4c1.5 1.5 3.5 2.5 3.5 5 0 2-2 4-9.5 4S3 18 3 16Z"/></svg>',
    Gota: '<svg viewBox="0 0 24 24" fill="none" stroke="var(--school-black)" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2.5s7 8 7 12.5a7 7 0 0 1-14 0c0-4.5 7-12.5 7-12.5Z"/></svg>'
  };
  const memoryTerms = Object.keys(memoryIcons);
  let memoryState = { first:null, second:null, lock:false, moves:0, matched:0 };
  function buildMemoryBoard(){
    const board=document.getElementById('memoryBoard');
    board.innerHTML='';
    memoryState={ first:null, second:null, lock:false, moves:0, matched:0 };
    document.getElementById('memoryMoves').textContent='Intentos: 0';
    const deck=[...memoryTerms,...memoryTerms]
      .map(v=>({v,sort:Math.random()}))
      .sort((a,b)=>a.sort-b.sort)
      .map(o=>o.v);
    deck.forEach((term,idx)=>{
      const card=document.createElement('div');
      card.className='memory-card';
      card.dataset.term=term;
      card.dataset.idx=idx;
      card.innerHTML=`
        <div class="memory-card-inner">
          <div class="memory-face memory-front" aria-label="Carta volteada"></div>
          <div class="memory-face memory-back" aria-label="Imagen de ${term}">${memoryIcons[term]}</div>
        </div>`;
      card.addEventListener('click',()=>flipMemoryCard(card));
      board.appendChild(card);
    });
  }
  function flipMemoryCard(card){
    if(memoryState.lock) return;
    if(card.classList.contains('flipped') || card.classList.contains('matched')) return;
    card.classList.add('flipped');
    if(!memoryState.first){
      memoryState.first=card;
      return;
    }
    memoryState.second=card;
    memoryState.lock=true;
    memoryState.moves++;
    document.getElementById('memoryMoves').textContent=`Intentos: ${memoryState.moves}`;
    if(memoryState.first.dataset.term===memoryState.second.dataset.term){
      memoryState.first.classList.add('matched');
      memoryState.second.classList.add('matched');
      memoryState.matched++;
      resetMemoryTurn();
    }else{
      setTimeout(()=>{
        memoryState.first.classList.remove('flipped');
        memoryState.second.classList.remove('flipped');
        resetMemoryTurn();
      },900);
    }
  }
  function resetMemoryTurn(){
    memoryState.first=null;
    memoryState.second=null;
    memoryState.lock=false;
  }
  document.getElementById('memoryRestart').addEventListener('click', buildMemoryBoard);
  buildMemoryBoard();
</script>
</body>
</html>
