import React from 'react';
import './Footer.css';
import 'bootstrap-icons/font/bootstrap-icons.css';

function Footer() {
    return (
        <div className="footer">
            
            <h2 style={{ color: 'black' }}>SmartML Labs</h2>
            <div className="footer-section">
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#">Our Mission</a></li>
                    <li><a href="#">Our Vision</a></li>
                    <li><a href="#">Our Team</a></li>
                    <li><a href="#contact">Contact Us</a></li>
                </ul>
            </div>
            <div className="footer-section">
                <ul>
                    <li>
                        <i class="bi bi-instagram">
                            <a href="https://www.instagram.com/smartmllabs" target='_blank noopener noreferrer'> Instagram
                            </a>
                        </i>
                    </li>
                    <li>
                        <i class="bi bi-linkedin">
                            <a href="https://www.linkedin.com/company/102994614/admin/feed/posts/" target='_blank noopener noreferrer'>  LinkedIn
                            </a>
                        </i>
                    </li>
                    <li>
                        <i class="bi bi-whatsapp">
                            <a href="#" target='_blank noopener noreferrer'>  WhatsApp
                            </a>
                        </i>
                    </li>
                    <li>
                        <i class="bi bi-twitter-x">
                            <a href="https://x.com/smartmllabs?s=11" target='_blank noopener noreferrer'>  X
                            </a>
                        </i>
                    </li>
                    <li><i class="bi bi-facebook"><a href="#">  Facebook</a></i></li>
                </ul>
            </div>
            <div className="footer-section">
                <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>
        </div>
    );
}

export default Footer;
