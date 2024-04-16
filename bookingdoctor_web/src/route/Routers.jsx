import React from 'react'
import { Routes, Route, Navigate } from 'react-router-dom'
import { Home, Doctor, DoctorDetail, About, Contact, Login, Signup } from '../pages'

const Routers = () => {
    return (
        <Routes>
        <Route path='/' element={<Navigate to='/home' />} />
        <Route path='/home' element={<Home />} />
        <Route path='/doctor' element={<Doctor />} />
        <Route path='/doctor/{id}' element={<DoctorDetail />} />
        <Route path='/about' element={<About />} />
        <Route path='/contact' element={<Contact />} />
        <Route path='/login' element={<Login />} />
        <Route path='/signup' element={<Signup />} />
    </Routes>
      )
}

export default Routers