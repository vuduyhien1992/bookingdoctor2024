import React from 'react'

const Header = () => {
  return (
    <>
      {/* Khoa edit heder  */}
      {/* <nav className='navbar_style'>
                <div className='header container'>
                    <div className='logo'>Medi<span className='logo-span'>care</span></div>
                    <div className='nav__bar'>
                        <ul className='menu'>

                            <li className='menu__item'><a href="/about" className='menu__link'>About Us</a></li>
                            <li className='menu__item'><a href="/booking" className='menu__link'>Booking an appointment</a></li>
                            <li className='menu__item'><a href="/service" className='menu__link'>Service</a></li>
                            <li className='menu__item'><a href="/doctor" className='menu__link'>For Doctor</a></li>
                            <li className='menu__item'><a href="/login" className='menu__link'>Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav> */}
      <nav class="navbar navbar-expand-lg bg-light fixed-top">
        <div class="container">
          <a class="navbar-brand logo" href="#">Medi<span className='logo-span'>care</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto me-5">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Booking an appointment</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Service</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">For Doctor</a>
              </li>
            </ul>
            <a href="#" className='login'>Login</a>
          </div>
        </div>
      </nav>
    </>
  )
}

export default Header