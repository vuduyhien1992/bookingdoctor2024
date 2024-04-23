import React from 'react'

const Header = () => {
  return (
    <>
    {/* Khoa edit heder  */}
        <nav className='navbar'>
                <div className='header'>
                    <div className='logo'>Medi<span className='logo-span'>care</span></div>
                    <div className=''>
                        <ul className='menu'>
                            <li className='menu__item'><a href="/about" className='menu__link'>About Us</a></li>
                            <li className='menu__item'><a href="/booking" className='menu__link'>Booking an appointment</a></li>
                            <li className='menu__item'><a href="/service" className='menu__link'>Service</a></li>
                            <li className='menu__item'><a href="/doctor" className='menu__link'>For Doctor</a></li>
                            <li className='menu__item'><a href="/login" className='menu__link'>Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
    </>
  )
}

export default Header