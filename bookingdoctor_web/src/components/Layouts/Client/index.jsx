import Header from './Header';
import Footer from './Footer';

function ClientLayout({children}) {
    return (
        <div>
            <Header/>
            <div className='container'>
                <div className='content'>{children}</div>
            </div>
            <Footer/>
        </div>
    );
}

export default ClientLayout;