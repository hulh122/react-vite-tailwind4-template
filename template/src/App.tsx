import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Home from './pages/Home';

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<Home />} />
          {/* 路由将基于提供的 HTML 文件自动生成 */}
        </Routes>
      </Layout>
    </Router>
  );
}

export default App;