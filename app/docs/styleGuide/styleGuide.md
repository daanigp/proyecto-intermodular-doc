# Proyecto Intermodular - La Cancha del Saber

## Documentación Oficial

### Guía de estilo

## 1. Estructura

```
┌────────────────────────────┐
│           HEADER           │
├────────────────────────────┤
│                            │
│          CONTENIDO         │
│                            │
├────────────────────────────┤
│           FOOTER           │
└────────────────────────────┘
```

La aplicación web sigue la siguiente estructura:

* **Header** -> se desplaza con el scroll de la página, por lo que no permanece fijo. `(templates/header.php)`
* **Contenido** -> se adapta al flujo de la página y se desplaza de forma natural durante el scroll.
* **Footer** -> se desplaza con el scroll de la página, por lo que no permanece fijo. `(templates/footer.php)`

## 2. Colores

La paleta se define mediante variables CSS en `:root`.

| Variable                         |                    Uso                      |
| -------------------------------- | ------------------------------------------- |
| `--background-main`              | Fondo general                               |
| `--background-cards`             | Fondo de cards                              |
| `--background-card-game`         | Fondo de las tarjetas                       |
| `--background-header-footer`     | Fondo en header y footer                    |
| `--background-dropdown-menu`     | Fondo del menu desplegable                  |
| `--background-dropdown-submenu`  | Fonde del submenu desplegable               |
| `--background-btns`              | Fondo botones                               |
| `--background-btns-hover`        | Fondo botones - hover                       |
| `--background-btns-shadow`       | Sombra de botones                           |
| `--menu-link`                    | Color de los links del menu                 |
| `--color-header-footer`          | Color del texto de header y footer          |
| `--color-error`                  | Color de los mensajes de error              |
| `--color-error-back`             | Fondo de botones de error                   |
| `--color-surface`                | Color del texto                             |
| `--color-border`                 | Color de bordes                             |
| `--color-dark`                   | Color negro/oscuro                          |
| `--color-muted`                  | Color grisaceo, para texto "transparente"   |
| `--color-accent`                 |                                             |
| `--color-dark-soft`              |                                             |
| `--color-res-correct`            | Color de la respuesta correcta              |
| `--color-res-correct-back`       | Fondo de respuesta correcta                 |
| `--color-res-correct-back-hover` | Fondo de respuesta correcta - hover         |
| `--color-greenLight`             | Color de titulos                            |
| `--color-greenLight-shadow`      | Sombra color verde                          |
| `--color-greenLight-hover`       | Color verde - hover                         |
| `--color-greenLight-dark`        | Color verde oscuro                          |
| `--color-text`                   | Color del texto                             |
| `--color-yellow`                 | Color btn exportar                          |

## 3. Fuente

La fuente que se ha utilizado es la funete Lucida Sans.

![img](img/lucidasans.png)

## 4. Menús

El menú está compuesto de la siguiente forma:

```
[icono]  Texto del ítem
```

* Normal: color de fondo de header.
* Hover: color de fondo `--background-btns-hover`
* Active: color de fondo `--background-btns-hover`
* El color de letra no cambia: `--menu-link`

Los iconos utilizan FontAwesome 7.0.1.

## 5. Imágenes

### _Logo de la web_

* Imagen header: `app/static/img/logo-header-LCDS.png`
* Dimensiones: 300px x 125px
* Logotipo: `app/static/icon/logo-LCDS.ico`

### _Fotos de perfil_

* Imagens alojadas en: `app/static/img/profile`
* Dimensiones en `perfil.php`: 150px x 150px
* Dimensiones en `perfil_edit.php`: 80px x 80px
* Dimensiones en `amigos.php`: 80px x 80px

## 6. Responsive

El diseño de la aplicación es _mobile first_, por lo que los diseños base son los que se aplican a *mobile*, y se van ampliando progresivamente a medida que se amplíe el tamaño de la pantalla.

Para el menú existen estos breackpoints:

| Breakpoint     | Rango              | Cambios                      |
| -------------- | ------------------ | -----------------------------|
| **Mobile**     |      < 790px       | Menú oculto                  |
| **Tablet**     | 790px > – < 1024px | Menú completamente visible   |
| **Desktop**    |      > 1024px      | Menú completamente visible   |

Para el resto de la web:

| Breakpoint     | Rango              | Cambios                                            |
| -------------- | ------------------ | -------------------------------------------------- |
| **Mobile**     |      < 768px       | Padding reducido, tamaño fuente reducido           |
| **Tablet**     | 768px > – < 1024px | Padding ligeramente reducido, tamaño fuente medio  |
| **Desktop**    |      > 1024px      | Padding normal, tamaño fuente normal               |
