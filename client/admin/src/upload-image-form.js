class UploadImageForm extends HTMLElement {
  constructor () {
    super()
    this.shadow = this.attachShadow({ mode: 'open' })
    this.avatarLinks = []
  }

  connectedCallback () {
    document.addEventListener('upload', (event) => {
      this.handleUpload(event)
    })
    this.render()
    this.loadData()
  }

  loadData () {
    this.avatarLinks = [
      { imgSrc: 'https://placehold.co/600x400', alt: 'A' },
      { imgSrc: 'https://placehold.co/600x400', alt: 'B' },
      { imgSrc: 'https://placehold.co/600x400', alt: 'C' },
      { imgSrc: 'https://placehold.co/600x400', alt: 'D' }
    ]
  }

  render () {
    this.shadow.innerHTML = /* html */
    `
    <style>
      * {
        box-sizing: border-box;
      }
      textarea {
        resize: none;
      }
      .head-close {
        display: flex;
        justify-content: flex-end;
      }
      .close-button {
        background: none;
        border: none;
        cursor: pointer;
        position: absolute;
      }
      .head-title {
        align-items: center;
        display: flex;
        justify-content: center;
      }
      .box {
        display: none;
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(255, 255, 255, 0.8);
        z-index: 3;
      }
      .box.active {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
      }
      .gallery {
        width: 80%;
        height: 80%;
        background-color: #fff;
      }
      .form {
        border-bottom: 1px solid #ccc;
        flex: 2;
      }

      .form-top-bar{
          display: flex;
          justify-content: center;
          background-color: white;
          height: 3rem;
          width: 100%;
      }
      .tabs{
          display: flex;
          height: 100%;
          width: 100%;
      }

      .tab{
          background-color: none;
          display: flex;
          align-items: center;
          padding: 0.5rem;
      }

      .tab:hover{
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        cursor: pointer;
      }

      .tab button{
        background: none;
        border: none;
        color: black;
      }

      .tab.active button{
          color: black;
      }

      .tab.active{
          color: black;
          background-color: hsl(206.87,84.81%,69.02%);
      }

      .tab-contents{
        width: 100%;
      }

      .tab-content.active{
        width: 100%;
        display: block;
      }

      .tab-content.active[data-tab="general"] {
        display: flex;
        justify-content: space-between;
      }
      .container{
        display: flex;
        justify-content: space-between;
        width: 100%;
      }

      .side-panel{
        width: 500px;
      }

      .tab-content{
        display: none;
      }

      .form-row{
        display: flex;
        gap: 0 1rem;
        margin: 1rem 0.5rem;
        flex-wrap: wrap;
      }

      .form-element {
        display: flex;
        justify-content: flex-start;
        flex-direction: column;
        gap: 0.5rem;
        margin: 1rem 0.5rem;
        width: 90%;
      }

      .form-element-input * {
        border: none;
        box-sizing: border-box;
        outline: transparent;
        width: 100%;
      }
      .form-element-input input {
        border: 1px solid #ccc;
      }
      .form-element-input textarea {
        border: 1px solid #ccc;
      }

      .form-element-input input[name="images"] {
        width: auto;
        gap: 0 1rem; 
      }

      .avatar{
        width: 4rem;
        height: 4rem;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center; justify-content: center;
      }
      .footer {
        align-items: center;
        background-color: white;
        display: flex;
        justify-content: flex-end;
      }
      </style>
          <div class="box">
            <div class="gallery">
              <div class="head-close">
                <button class="close-button">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 6L6 18" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M6 6L18 18" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                  </svg>
                </button>
              </div>
              <div class="head-title">
                <h1>Subir imágenes</h1>
              </div>
              <div class="body">
                <div class="form">
                  <div class="form-top-bar">
                    <div class="tabs">
                      <div class="tab active" data-tab="general">
                        <button>
                          General
                        </button>
                      </div>
                      <div class="tab" data-tab="images">
                        <button>
                          Subir imágenes
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <form class="admin-form">
                  <input type="hidden" name="id" value="">
                  <div class="tab-contents">
                    <div class="tab-content active" data-tab="general">
                      <div class="container">
                        <div class="form-row">
                        ${this.renderAvatars()}
                        </div>
                      </div>  
                      <div class="side-panel">
                        <div class="form-element">
                          <div class="form-element-label">
                            <label for="name">
                              Nombre
                            </label>
                          </div>
                          <div class="form-element-input">
                            <input type="text" name="name" value="">
                          </div>
                        </div>
                        <div class="form-element">
                          <div class="form-element-label">
                            <label for="description">
                              Descripción
                            </label>
                          </div>
                          <div class="form-element-input">
                            <textarea name="description" rows="8" cols="80"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-content" data-tab="images">
                      <div class="form-row">
                        <div class="form-element">
                          <div class="form-element-label">
                            <label for="upload-images">
                              Imagenes
                            </label>
                          </div>
                          <div class="form-element-input">
                            <input type="file" name="images" value="">
                            <button type="button" class="upload-image-button">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="footer">
                <button type="submit">
                  Guardar
                </button>
              </div>
            </div>
          </div>
    `
    this.handleTabs()
    this.handleCloseButton()
  }

  renderAvatars () {
    return this.avatarLinks
      .map(
        (avatarLinks) =>
          `<div class="avatar">
            <img src="${avatarLinks.imgSrc}" alt="${avatarLinks.alt}">
          </div>`
      )
      .join('')
  }

  handleTabs () {
    const main = this.shadow.querySelector('.form')
    main?.addEventListener('click', (event) => {
      if (event.target.closest('.tab')) {
        if (event.target.closest('.tab').classList.contains('active')) {
          return
        }

        const tabClicked = event.target.closest('.tab')
        const tabActive = tabClicked.parentElement.querySelector('.active')

        tabClicked.classList.add('active')
        tabActive.classList.remove('active')
        this.shadow
          .querySelector(`.tab-content.active[data-tab="${tabActive.dataset.tab}"]`)
          .classList.remove('active')
        this.shadow
          .querySelector(`.tab-content[data-tab="${tabClicked.dataset.tab}"]`)
          .classList.add('active')
      }
    })
  }

  handleCloseButton () {
    const closeButton = this.shadow.querySelector('.close-button')
    closeButton.addEventListener('click', () => {
      const boxElement = this.shadow.querySelector('.box')
      boxElement.classList.remove('active')
    })
  }

  handleUpload (event) {
    const boxElement = this.shadow.querySelector('.box')
    boxElement.classList.add('active')
  }
}

customElements.define('upload-image-form', UploadImageForm)
