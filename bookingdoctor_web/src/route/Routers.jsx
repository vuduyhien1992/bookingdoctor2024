import React from 'react'
import { Routes, Route, Navigate } from 'react-router-dom'
import { Home, Doctor, DoctorDetail, About, Contact, Login, Signup } from '../pages'
import { UserRouters,DoctorRoutes,AdminRouters } from '../utils'

const Routers = () => {
    return (
        <Routes>
            //public routes
            <Route path='/' element={<Navigate to='/home' />} />
            <Route path='/home' element={<Home />} />
            <Route path='/about' element={<About />} />
            <Route path='/contact' element={<Contact />} />
            <Route path='/login' element={<Login />} />
            <Route path='/signup' element={<Signup />} />

            //routes for users
            <Route element={<UserRouters/>}>
                viết router của users tại đây
            </Route>


            //routers for doctors
            <Route element={<DoctorRoutes/>}>
                <Route path='/doctor' element={<Doctor />} />
                <Route path='/doctor/{id}' element={<DoctorDetail />} />
            </Route>
          
           
            //Routers for Admin
            <Route element={<AdminRouters/>}>
                // viết route của admin tại đây
            </Route>
    </Routes>
      )
}

export default Routers