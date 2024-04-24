import React from 'react'
import {Link} from "react-router-dom";

const Header = () => {
  return (
    <>
    {/* Khoa edit heder  */}
        <nav className='navbar'>
                <div className='header'>
                    <div className='logo'>Medi<span className='logo-span'>care</span></div>
                    <div className='linklist'>
                        <ul className='menu'>
                            <li className='menu_item'><Link to="/about" className='menu_link'>About Us</Link></li>
                            <li className='menu_item'><Link to="/booking" className='menu_link'>Booking an appointment</Link></li>
                            <li className='menu_item'><Link to="/service" className='menu_link'>Service</Link></li>
                            <li className='menu_item'><Link to="/doctor" className='menu_link'>For Doctor</Link></li>
                            <li className='menu_item'><Link to="/login" className='menu_link'>Login</Link></li>
                            <li className='menu_item'><Link to="/signup" className='menu_link'>Sign Up</Link></li>
                        </ul>
                    </div>
                </div>
            </nav>
    </>
  )
}

export default Header