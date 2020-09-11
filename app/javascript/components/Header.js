import React, { useEffect, useState } from "react";
import styles from "./Header.module.css";
import PropTypes from "prop-types"



const Header = (props) => {

  const [turningScrollpos, setTurningScrollpos] = useState(40);
  const [scrolled, setScrolled] = useState(false);

  // スクロールを認知したらhandleScrollを実行
  useEffect(() => {
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  });

  // スクロールしているのか否か判断する関数
  const handleScroll = () => {
    // window.pageYOffsetは垂直方向のスクロール量
    // currentScrollPosはスクロールした量
    const currentScrollPos = window.pageYOffset;
    const scrolled = turningScrollpos < currentScrollPos;
    setScrolled(scrolled);
  };

  return (
    <React.Fragment>
      <div className={`${styles.menubar} ${scrolled ? styles.hidden : null}`}>
      <a href="/posts">
      <div className={styles.namebox}>
          <h1
            className={`${styles.title} ${
              scrolled ? styles.hidden_title : null
            }`}
          >
            Table Share
          </h1>
      </div>
      </a>
      <div className={styles.menu}>
        <nav>
              <ul>
                <li><i className="fas fa-user color"></i><a href="/users/1">プロフィール</a></li>
                <li><i className="fas fa-home color"></i><a href="/posts">投稿一覧</a></li>
              </ul>
        </nav>
      </div>
    </div>
    </React.Fragment>
  );
}


export default Header;
