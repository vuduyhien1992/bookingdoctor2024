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
                            <li className='menu__item'><a href="" className='menu__link'>About Us</a></li>
                            <li className='menu__item'><a href="" className='menu__link'>Booking an appointment</a></li>
                            <li className='menu__item'><a href="" className='menu__link'>Service</a></li>
                            <li className='menu__item'><a href="" className='menu__link'>For Doctor</a></li>
                        </ul>
                        <a href="#" className='login'>Login</a>
                    </div>
                </div>
            </nav>
    </>
  )
}

export default Header