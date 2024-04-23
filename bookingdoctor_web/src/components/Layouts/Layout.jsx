import React from 'react'
import Header from '../Header/Header'
import Footer from '../Footer/Footer'
import Routers from '../../route/Routers'
const Layout = () => {
    return (
        <>
                <Header />
                <div className='main-app container'>
                    <Routers />
                </div>
                <Footer />
    
            </>
      )
}

export default Layout